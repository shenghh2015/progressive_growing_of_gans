#export LSF_DOCKER_VOLUMES='/scratch1/fs1/anastasio/Data_FDA_Breast:/scratch/xray_set'
export LSF_DOCKER_VOLUMES='/home/shenghuahe/anomaly_data:/data'
export LSF_DOCKER_NETWORK=host
export LSF_DOCKER_IPC=host 
export LSF_DOCKER_SHM_SIZE=40G
bsub -G compute-anastasio -n 4 -R 'span[ptile=4] select[mem>100000] rusage[mem=100GB]' -q anastasio -a 'docker(shenghh2020/progan_tf:latest)' -gpu "num=4" -o /home/shenghuahe/anomaly_data/logs/GAN_4GPU_$RANDOM /bin/bash /home/shenghuahe/proGAN/v100.sh