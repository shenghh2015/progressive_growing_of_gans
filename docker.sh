chcon -Rt svirt_sandbox_file_t /home/sh38/Anom_Detection/
docker run --gpus all -v /home/sh38/Anom_Detection/:/data -w /data/proGAN/ -it --user $(id -u):$(id -g) shenghh2020/progan_tf:latest