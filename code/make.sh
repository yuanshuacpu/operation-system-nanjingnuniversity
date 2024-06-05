#!/bin/bash

# while [ 1 ] 
# do
#     echo 1 >/dev/null
# done


if [ $# -ge 1 ]; then
    case ${1} in
    "bear")
        bear -- make ARCH=x86_64-qemu
        ;;
    "run_debug")
        qemu-system-x86_64 -nographic -S -s -serial mon:stdio -machine accel=tcg -smp "" -drive format=raw,file=/home/code/code/build/hello-x86_64-qemu
        ;;
    "run")
        qemu-system-x86_64 -nographic  -serial mon:stdio -machine accel=tcg -smp "" -drive format=raw,file=/home/code/code/build/hello-x86_64-qemu
        ;;
    "debug") 
         make -n --trace  ARCH=x86_64-qemu > ./info
        ;;
    *)
        echo " ${0} usage:[bear] " 
        ;;
    esac

else
    make ARCH=x86_64-qemu
fi