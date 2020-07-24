#!/bin/sh

KITTI_DATASET=/media/ken/EC-PHU3/dataset/kitti/object

docker run --gpus all -it --rm \
           -v `pwd`:/workspace/OpenPCDet \
           -v ${KITTI_DATASET}:/dataset/kitti \
           pv-rcnn:test 

# display settings in container
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0

# cd OpenPCDet
# python setup.py develop
# cd tools
# python test.py --cfg_file cfgs/kitti_models/pv_rcnn.yaml --batch_size 4 --ckpt ../pv_rcnn_8369.pth