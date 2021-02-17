#!/bin/bash

export HOST_PATH="/data/soft-ree69"
export SINGULARITY_CACHEDIR="/data/soft-ree69/singularity/cache"
export SINGULARITY_TMPDIR="/data/soft-ree69/singularity/tmp"
alias kd="/vol/linux/apps/singularity/bin/singularity run --no-mount tmp --writable-tmpfs --bind $HOST_PATH/klee:/tmp/klee_src --bind $HOST_PATH/experiments:/tmp/experiments --bind $HOST_PATH/results:/tmp/results/ --bind $HOST_PATH/klee_build:/tmp/klee_build/ --bind $HOST_PATH/tmpdir:/tmp/tmpdir/ docker://kleedev/klee-70024"
alias qcg="/vol/srg/70024-SymEx/qcachegrind"
export PATH="$HOST_PATH/klee/scripts:$PATH" 

t1=$(date +%s)
#row 1
kd rm -rf /tmp/results/cat-arg
kd klee --libc=uclibc --posix-runtime --output-dir=/tmp/results/cat-arg /tmp/experiments/coreutils-8.31/obj-llvm/src/cat.bc --sym-arg 2 /etc/hostname --sym-stdin 1
time1=$(($(date +%s) - $t1))
echo "Took $time1 secs"

t2=$(date +%s)
#row 2
kd rm -rf /tmp/results/cat-version
kd klee --libc=uclibc --posix-runtime --output-dir=/tmp/results/cat-version /tmp/experiments/coreutils-8.31/obj-llvm/src/cat.bc --version
time2=$(($(date +%s) - $t2))
echo "Took $time2 secs"

t3=$(date +%s)
#row 3
kd rm -rf /tmp/results/cat-stdin
kd klee --libc=uclibc --posix-runtime --output-dir=/tmp/results/cat-stdin /tmp/experiments/coreutils-8.31/obj-llvm/src/cat.bc --sym-arg 1 /etc/hostname --sym-stdin 2 
time3=$(($(date +%s) - $t3))
echo "Took $time3 secs"

echo "Times taken: $time1, $time2, $time3"