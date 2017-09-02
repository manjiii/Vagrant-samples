#!/bin/bash

DOCKERS=`docker ps --format "{{.Names}}"`
DOCKERS_ARRAY=(`echo $DOCKERS`)

function selectContainer(){

  cont_count=${#DOCKERS_ARRAY[@]}

  if [ $cont_count = 0  ]; then
    echo "There are no container..."
    exit 0;
  fi

  echo "------------------------------------------------"
  for i in ${!DOCKERS_ARRAY[@]}; do
    echo "$i) ${DOCKERS_ARRAY[$i]}"
  done
  echo "------------------------------------------------"
  echo "Please choice container"

  read input

  if [ -z $input ]; then
    echo ""
    selectContainer
  fi

  check_num=`echo "${input}" | awk '/[^0-9]/ {print}'`
  if [ ! -z "$check_num" ]; then
    echo ""
    echo "ERROR: Please input container's number."

    selectContainer
  fi

  if [ $input -gt $cont_count ]; then
    echo ""
    echo "ERROR: There are $cont_count container."
    selectContainer
  fi
}

selectContainer

echo "login to ${DOCKERS_ARRAY[$input]}..."
docker exec -it ${DOCKERS_ARRAY[$input]} bash
exit 0