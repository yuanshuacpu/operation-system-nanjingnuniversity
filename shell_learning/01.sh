# !/bin/bash
# 功能：显示当前身份


cut -d ':' -f1 /etc/passwd > temp_file

file_save=$(cat temp_file)

rm -rf temp_file

index=1

for i in $file_save
do
    echo "The $index is "$i"" 
    index=$(($index+1))
done

