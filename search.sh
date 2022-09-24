#! /bin/bash

#查找函数
function FindTargetFile() {
 for file in $(ls $1)
 do
    if [ $file = $target ]
        then
            Path[$cnt]="$1$file"
            cnt=$[ $cnt + 1 ]
    fi
  
    if [ -d "$1$file" -a -r "$1$file" ]
        then
            FindTargetFile "$1$file/"
    fi

 done
}

#定义变量
target=$2
cnt=0
Path=()

#递归深搜
FindTargetFile $1

#判断文件
if [ $cnt -eq 0 ]
    then 
        echo 'Not Found!'
    else
        echo 'Find it!'
fi

#结果返回
for path in ${Path[@]}
do
    echo $path
done