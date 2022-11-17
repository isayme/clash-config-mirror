#!/bin/bash

YYYY=$(date -u +"%Y")
MM=$(date -u +"%m")

YYYYMM=$(date -u +"%Y%m")
YYYYMMDD=$(date -u +"%Y%m%d")

WEFOUND_CC_URL=https://wefound.cc/freenode/${YYYYMM}/${YYYYMMDD}.yaml
NODEFREE_ORG_URL=https://nodefree.org/dy/${YYYYMM}/${YYYYMMDD}.yaml
CLASH_NODE_COM_URL=https://clashnode.com/wp-content/uploads/${YYYY}/${MM}/${YYYYMMDD}.yaml

echo downloading $WEFOUND_CC_URL ...
wget $WEFOUND_CC_URL -O ./public/wefoundcc.yaml

echo downloading $NODEFREE_ORG_URL ...
wget $NODEFREE_ORG_URL -O ./public/nodefreeorg.yaml

echo downloading $CLASH_NODE_COM_URL ...
wget $CLASH_NODE_COM_URL -O ./public/clashnodecom.yaml
