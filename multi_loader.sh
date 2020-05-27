cd /home/shenghuahe/proGAN
python2 v100_job_parser.py 'multi_GPU.sh'
for i in $(seq 0 0)
do
   sh v100_jobs/job_$i.sh&
   sleep 10s &
done
wait
