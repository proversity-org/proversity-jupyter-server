#!/bin/bash
umount -l $EFS_MOUNT_POINT
# Need to use $REGION and $EFS_ID environment variables. Can't use a find and replace upon deploy because the changes have to then be comitted.
mount -t nfs4 -o nfsvers=4.1 $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone).$EFS_FS_ID.efs.$EFS_REGION.amazonaws.com:/ $EFS_MOUNT_POINT
sudo chmod -R 0777 /notebooks
sudo chown -R root:root /notebooks