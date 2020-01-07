# Input your Jenkins domain
domain=https://<your Jenkins domain>
# Input directory with Jenkins jobs
job_dir=/mcpaint/jenkins_home/jobs

IFS=$'\n' jobs=(`ls -1 $job_dir`)

for job in "${jobs[@]}"; do
  build_dir=$job_dir/$job/builds
  encoded_job=$(python -c "import urllib; print urllib.quote('''$job''')")
  if test -d $build_dir
    then echo -e "$(ls -A1 $build_dir | grep -v last | grep -v legacyIds | wc -l) $job\t$domain/job/$encoded_job"
  fi
done
