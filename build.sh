#!/bin/bash

program=`echo ${1} | awk -F. '{ print $1 }'`
type=`echo ${1} | awk -F. '{ print $2 }'`

cp ${1} ${program}-32.${type}
cp ${1} ${program}-64.${type}

sed -i s/xVs/x32/ ${program}-32.${type}
sed -i s/xVs/x64/ ${program}-64.${type}

g++ -m32 ${program}-32.${type} -o ${program}-32release
g++ -g -m32 ${program}-32.${type} -o ${program}-32debug

g++ -m64 ${program}-64.${type} -o ${program}-64release
g++ -g -m64 ${1} -o ${program}-64debug

tar -zcvf malloc-32release.tar.gz ${program}-32release
tar -zcvf malloc-64release.tar.gz ${program}-64release

rm -rf ${program}-64.${type} ${program}-32.${type}