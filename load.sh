#!/bin/bash

YYYY=$(date +"%Y")
MM=$(date +"%m")

YYYYMM=$(date +"%Y%m")
YYYYMMDD=$(date +"%Y%m%d")

NODEFREE_ORG_URL=https://nodefree.org/dy/${YYYYMM}/${YYYYMMDD}.yaml
CLASH_NODE_COM_URL=https://clashnode.com/wp-content/uploads/${YYYY}/${MM}/${YYYYMMDD}.yaml

echo downloading $NODEFREE_ORG_URL ...
FILENAME=nodefreeorg.yaml
(wget $NODEFREE_ORG_URL -O ./public/${FILENAME}.tmp && mv ./public/${FILENAME}.tmp ./public/${FILENAME}) || (rm ./public/${FILENAME}.tmp && echo "remove ${FILENAME}.tmp")

echo downloading $CLASH_NODE_COM_URL ...
FILENAME=clashnodecom.yaml
(wget $CLASH_NODE_COM_URL -O ./public/${FILENAME}.tmp && mv ./public/${FILENAME}.tmp ./public/${FILENAME}) || (rm ./public/${FILENAME}.tmp && echo "remove ${FILENAME}.tmp")
