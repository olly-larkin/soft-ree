#!/bin/bash

export HOST_PATH="/data/soft-ree69"
export SINGULARITY_CACHEDIR="/data/soft-ree69/singularity/cache"
export SINGULARITY_TMPDIR="/data/soft-ree69/singularity/tmp"
alias kd="/vol/linux/apps/singularity/bin/singularity run --no-mount tmp --writable-tmpfs --bind $HOST_PATH/klee:/tmp/klee_src --bind $HOST_PATH/experiments:/tmp/experiments --bind $HOST_PATH/results:/tmp/results/ --bind $HOST_PATH/klee_build:/tmp/klee_build/ --bind $HOST_PATH/tmpdir:/tmp/tmpdir/ docker://kleedev/klee-70024"

# Directory for the compiled artefact
kd mkdir -p /tmp/experiments/get_sign
# Compile source code
kd clang-9 -I /tmp/klee_src/include -emit-llvm -c -g -O0 -Xclang -disable-O0-optnone /tmp/klee_src/examples/get_sign/get_sign.c -o /tmp/experiments/get_sign/get_sign.bc
# Remove potential previous runs
kd rm -rf /tmp/results/get_sign
# Run KLEE
kd klee --output-dir=/tmp/results/get_sign /tmp/experiments/get_sign/get_sign.bc
# Show generated test cases
kd ls /tmp/results/get_sign
kd ktest-tool /tmp/results/get_sign/test000001.ktest
kd ktest-tool /tmp/results/get_sign/test000002.ktest
kd ktest-tool /tmp/results/get_sign/test000003.ktest
kd clang-9 -I /tmp/klee_src/include -L /tmp/klee_build90stp_z3/lib /tmp/klee_src/examples/get_sign/get_sign.c -lkleeRuntest -o /tmp/experiments/get_sign/a.out
kd /bin/bash -c "KTEST_FILE=/tmp/results/get_sign/test000001.ktest /tmp/experiments/get_sign/a.out; echo $?"
kd /bin/bash -c 'KTEST_FILE=/tmp/results/get_sign/test000002.ktest /tmp/experiments/get_sign/a.out; echo $?'
kd /bin/bash -c 'KTEST_FILE=/tmp/results/get_sign/test000003.ktest /tmp/experiments/get_sign/a.out; echo $?'
