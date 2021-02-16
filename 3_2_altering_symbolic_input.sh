#!/bin/bash

export HOST_PATH="/data/soft-ree69"
export SINGULARITY_CACHEDIR="/data/soft-ree69/singularity/cache"
export SINGULARITY_TMPDIR="/data/soft-ree69/singularity/tmp"
alias kd="/vol/linux/apps/singularity/bin/singularity run --no-mount tmp --writable-tmpfs --bind $HOST_PATH/klee:/tmp/klee_src --bind $HOST_PATH/experiments:/tmp/experiments --bind $HOST_PATH/results:/tmp/results/ --bind $HOST_PATH/klee_build:/tmp/klee_build/ --bind $HOST_PATH/tmpdir:/tmp/tmpdir/ docker://kleedev/klee-70024"
alias qcg="/vol/srg/70024-SymEx/qcachegrind"
export PATH="$HOST_PATH/klee/scripts:$PATH" 

t1=$(date +%s)
#row 1
kd klee --libc=uclibc --posix-runtime /tmp/experiments/coreutils-8.31/obj-llvm/src/cat.bc --sym-arg 2 /etc/hostname --sym-stdin 1 --output-dir=/tmp/results/cat-arg 
time=$(($(date +%s) - $t1))
echo "Took $time secs"

t2=$(date +%s)
#row 2
kd klee --libc=uclibc --posix-runtime /tmp/experiments/coreutils-8.31/obj-llvm/src/cat.bc --version --output-dir=/tmp/results/cat-version
time=$(($(date +%s) - $t2))
echo "Took $time secs"

t3=$(date +%s)
#row 3
kd klee --libc=uclibc --posix-runtime /tmp/experiments/coreutils-8.31/obj-llvm/src/cat.bc --sym-arg 1 /etc/hostname --sym-stdin 2 --output-dir=/tmp/results/cat-stdin
time=$(($(date +%s) - $t3))
echo "Took $time secs"