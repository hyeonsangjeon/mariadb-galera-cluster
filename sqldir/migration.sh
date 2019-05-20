#!/bin/bash

checkvariablecnt=$#

if [ $checkvariablecnt == 4 ]; then
  echo "COME variable 4"
  echo "Migrate to an existing [ $3 ]schema. "
  mysql -u$1 -p$2 --database=$3   <  $4
else
  echo "Migrate file $3 "
  mysql -u$1 -p$2   <  $3
fi







