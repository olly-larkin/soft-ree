#!/bin/bash

export HOST_PATH="/data/soft-ree69"
export SINGULARITY_CACHEDIR="/data/soft-ree69/singularity/cache"
export SINGULARITY_TMPDIR="/data/soft-ree69/singularity/tmp"
alias kd="/vol/linux/apps/singularity/bin/singularity run --no-mount tmp --writable-tmpfs --bind $HOST_PATH/klee:/tmp/klee_src --bind $HOST_PATH/experiments:/tmp/experiments --bind $HOST_PATH/results:/tmp/results/ --bind $HOST_PATH/klee_build:/tmp/klee_build/ --bind $HOST_PATH/tmpdir:/tmp/tmpdir/ docker://kleedev/klee-70024"
alias qcg="/vol/srg/70024-SymEx/qcachegrind"
export PATH="$HOST_PATH/klee/scripts:$PATH" 

# Prepare the grafana directory
mkdir -p "$HOST_PATH"/grafana/dashboards
mkdir -p "$HOST_PATH"/grafana/plugins
wget https://grafana.com/api/plugins/grafana-simple-json-datasource/versions/1.4.1/download -O "$HOST_PATH"/grafana/plugins/json_plugin.zip
unzip "$HOST_PATH"/grafana/plugins/json_plugin.zip -d "$HOST_PATH"/grafana/plugins/
wget https://raw.githubusercontent.com/klee/klee/master/utils/grafana/klee_dashboard.json -O $HOST_PATH/grafana/dashboards/klee.json
# Run grafana
/vol/linux/apps/singularity/bin/singularity run --bind "$HOST_PATH"/grafana:/var/lib/grafana docker://klee/grafana

##### run 2_4_2_run_in_parallel.sh to get results #####