#!/bin/bash

export HOST_PATH="/data/soft-ree69"
export SINGULARITY_CACHEDIR="/data/soft-ree69/singularity/cache"
export SINGULARITY_TMPDIR="/data/soft-ree69/singularity/tmp"
alias kd="/vol/linux/apps/singularity/bin/singularity run --no-mount tmp --writable-tmpfs --bind $HOST_PATH/klee:/tmp/klee_src --bind $HOST_PATH/experiments:/tmp/experiments --bind $HOST_PATH/results:/tmp/results/ --bind $HOST_PATH/klee_build:/tmp/klee_build/ --bind $HOST_PATH/tmpdir:/tmp/tmpdir/ docker://kleedev/klee-70024"
alias qcg="/vol/srg/70024-SymEx/qcachegrind"
export PATH="$HOST_PATH/klee/scripts:$PATH" 


kd wget https://ftp.gnu.org/gnu/coreutils/coreutils-8.31.tar.xz -O /tmp/experiments/coreutils.tar.xz
kd tar xf /tmp/experiments/coreutils.tar.xz -C /tmp/experiments
kd mkdir -p /tmp/experiments/coreutils-8.31/obj-llvm
kd /bin/bash -c 'cd /tmp/experiments/coreutils-8.31/obj-llvm && LLVM_COMPILER=clang CC=wllvm ../configure --disable-nls CFLAGS="-g -O1 -Xclang -disable-llvm-passes -D__NO_STRING_INLINES -D_FORTIFY_SOURCE=0 -U__OPTIMIZE__"'
kd /bin/bash -c 'cd /tmp/experiments/coreutils-8.31/obj-llvm && LLVM_COMPILER=clang make'
kd /bin/bash -c "cd /tmp/experiments/coreutils-8.31/obj-llvm && export LLVM_COMPILER=clang && find . -executable -type f | xargs -I '{}' extract-bc '{}'"

kd klee --libc=uclibc --posix-runtime --output-dir=/tmp/results/coreutils-simple-run /tmp/experiments/coreutils-8.31/obj-llvm/src/cat.bc --version
