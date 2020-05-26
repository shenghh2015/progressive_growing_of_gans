import numpy as np
import os
import scipy.misc as misc

def normalize_0_1(data):
	data = np.squeeze(data)
	shp = data.shape
	_shp = (shp[0],)
	for i in range(1,len(shp)):
		_shp = _shp + (1,)
	data = (data - np.amin(np.amin(data, axis = -1), axis = -1).reshape(_shp))/\
			(np.amax(np.amax(data, axis = -1), axis = -1).reshape(_shp)-\
			np.amin(np.amin(data, axis = -1), axis = -1).reshape(_shp))
	image_sum = np.squeeze(np.apply_over_axes(np.sum, data, axes = [1,2]))
	return data[~np.isnan(image_sum),:]

docker = True

input_image_file = '/shared/planck/CommonData/MRI/anomaly_detection_data/axial_batch2_256x256.npy'
output_image_dir = '/shared/radon/Phantom/Breast_Xray'

print('Data loading ...')
img = np.load(input_image_file)
indx = 0
for i in range(img.shape[0]):
	image = img[i,:]; image = (image - np.min(image))/(np.max(image)-np.min(image))
	image_sum = np.sum(image)
	if np.isnan(image_sum):
		continue
	else:
		misc.imsave('{}/image_{}.png'.format(output_image_dir, indx),image)
		indx = indx + 1
	if indx%1000 == 0:
		print('Save the {}-th'.format(indx))