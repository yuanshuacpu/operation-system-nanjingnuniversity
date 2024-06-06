#!/bin/bash

# while [ 1 ] 
# do
#     echo 1 >/dev/null
# done

WorkDir=/home/code/

cd ${WorkDir}

if [ $# -ge 2 ]; then

    File_Path=$2/build/$(ls $2/build | grep "${2}-x86_64-qemu$" )

    case ${1} in
    "clean")
        make  -C ${WorkDir}/${2} clean 
        ;;
    "move")
        cp  ${WorkDir}/${2}/compile_commands.json ${WorkDir}
        ;;
    "make")
        make  -C ${WorkDir}/${2} ARCH=x86_64-qemu  
        ;;
    "bear")
        bear -- make  -C ${WorkDir}/${2} ARCH=x86_64-qemu  
        ;;
    "run_debug")
        qemu-system-x86_64  -S -s -serial mon:stdio -machine accel=tcg -smp "" -drive format=raw,file=${File_Path}
        ;;
    "run")
        qemu-system-x86_64  -serial mon:stdio -machine accel=tcg -smp "" -drive format=raw,file=${File_Path}
        ;;
    "debug") 
         make  -C ${WorkDir}/${2} -n --trace  ARCH=x86_64-qemu  > ./info
        ;;
    *)
        echo " ${0} usage:[bear] [filedir] "
        ;;
    esac
else
     echo " ${0} usage:[bear] [filedir] acquire 2 "
fi