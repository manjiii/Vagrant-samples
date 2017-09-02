#!/bin/bash

echo "------------------------------------------------"
docker ps
echo "------------------------------------------------"

function selectContainer(){

  cont_count=`docker ps -q | wc -l`

  if [ $cont_count = 0  ]; then
    echo "There are no container"
    exit 0;
  fi

  echo "Please choice container and input it's line number"

  read input
  
  if [ -z $input ]; then
    echo ""
    selectContainer
  fi

  check_num=`echo "${input}" | awk '/[^0-9]/ {print}'`
  if [ ! -z "$check_num" ]; then
    echo ""
    echo "ERROR: Please input line number."
    
    selectContainer
  fi

  if [ $input -gt $cont_count ]; then
    echo ""
    echo "ERROR: There are $cont_count container(s)."
    selectContainer
  fi
}

selectContainer

con_id=`docker ps -q | awk -v n=$input 'NR==n'`
if [ -n "$con_id" ]; then
  echo "login to continer. name: `docker ps | awk -v n=$(($input+1)) 'NR==n' | awk '{print $2}'`"
  docker exec -it $con_id bash
  exit 0
else
  echo "cannot find countainer...."
  exit 1
fi