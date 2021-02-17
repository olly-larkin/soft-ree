#!/bin/bash

export HOST_PATH="/data/soft-ree69"
export SINGULARITY_CACHEDIR="/data/soft-ree69/singularity/cache"
export SINGULARITY_TMPDIR="/data/soft-ree69/singularity/tmp"
alias kd="/vol/linux/apps/singularity/bin/singularity run --no-mount tmp --writable-tmpfs --bind $HOST_PATH/klee:/tmp/klee_src --bind $HOST_PATH/experiments:/tmp/experiments --bind $HOST_PATH/results:/tmp/results/ --bind $HOST_PATH/klee_build:/tmp/klee_build/ --bind $HOST_PATH/tmpdir:/tmp/tmpdir/ docker://kleedev/klee-70024"
alias qcg="/vol/srg/70024-SymEx/qcachegrind"
export PATH="$HOST_PATH/klee/scripts:$PATH" 

#row 1
kd rm -rf /tmp/results/expr-dfs
kd klee --libc=uclibc --posix-runtime --search=dfs --max-memory=1024 --max-time=10min --output-dir=/tmp/results/expr-dfs /tmp/experiments/coreutils-8.31/obj-llvm/src/expr.bc --sym-args 0 1 10 --sym-args 0 3 2 --sym-stdout

#row 2
kd rm -rf /tmp/results/expr-bfs
kd klee --libc=uclibc --posix-runtime --search=bfs --max-memory=1024 --max-time=10min --output-dir=/tmp/results/expr-bfs /tmp/experiments/coreutils-8.31/obj-llvm/src/expr.bc --sym-args 0 1 10 --sym-args 0 3 2 --sym-stdout

#row 3
kd rm -rf /tmp/results/expr-rcov
kd klee --libc=uclibc --posix-runtime --search=random-path --search=nurs:covnew --max-memory=1024 --max-time=10min --output-dir=/tmp/results/expr-rcov /tmp/experiments/coreutils-8.31/obj-llvm/src/expr.bc --sym-args 0 1 10 --sym-args 0 3 2 --sym-stdout
