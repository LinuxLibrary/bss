#!/bin/bash


# Variables
BASEDIR="/root/Manzil/sharedvol-efs/marketlive/services/bis/merchants/onekingslane/input"
ARCHIVE="$BASEDIR/archive"
INVENTORY="$ARCHIVE/inventory"
ORDERSTAT="$ARCHIVE/order-status"
ARCHIVE_ARC="$ARCHIVE/arc-backups"
INVENTORY_ARC="$INVENTORY/inv-backups"
ORDERSTAT_ARC="$ORDERSTAT/ord-backups"

function archiveArc() {
        if [ -d $ARCHIVE_ARC ]
        then
                echo "Performing archive on Archive directory"
        else
                echo "Backup directory not found"
                mkdir -p $ARCHIVE_ARC
                echo "Performing archive on Archive directory"
        fi

        if [ -d $ARCHIVE_ARC ]
        then
                mkdir -p /tmp/backup-`date +"%Y%m%d"`
                find $ARCHIVE -mtime +3 -print0 | xargs -0 -I {}  mv {} /tmp/backup-`date +"%Y%m%d"`
                tar -czvf backup-`date +"%Y%m%d"`.tar.gz /tmp/backup-`date +"%Y%m%d"`
                rm -rf /tmp/backup-`date +"%Y%m%d"`
                mv backup-`date +"%Y%m%d"`.tar.gz $ARCHIVE_ARC/
        fi
}

function invArc() {
        if [ -d $INVENTORY_ARC ]
        then
                echo "Performing archive on Archive directory"
        else
                echo "Backup directory not found"
                mkdir -p $INVENTORY_ARC
                echo "Performing archive on Archive directory"
        fi

        if [ -d $INVENTORY_ARC ]
        then
                mkdir -p /tmp/backup-`date +"%Y%m%d"`
                find $INVENTORY -mtime +3 -print0 | xargs -0 -I {}  mv {} /tmp/backup-`date +"%Y%m%d"`
                tar -czvf backup-`date +"%Y%m%d"`.tar.gz /tmp/backup-`date +"%Y%m%d"`
                rm -rf /tmp/backup-`date +"%Y%m%d"`
                mv backup-`date +"%Y%m%d"`.tar.gz $INVENTORY_ARC/
        fi
}

function orderArc() {
        if [ -d $ORDERSTAT_ARC ]
        then
                echo "Performing archive on Archive directory"
        else
                echo "Backup directory not found"
                mkdir -p $ORDERSTAT_ARC
                echo "Performing archive on Archive directory"
        fi

        if [ -d $ORDERSTAT_ARC ]
        then
                mkdir -p /tmp/backup-`date +"%Y%m%d"`
                find $ORDERSTAT -mtime +3 -print0 | xargs -0 -I {}  mv {} /tmp/backup-`date +"%Y%m%d"`
                tar -czvf backup-`date +"%Y%m%d"`.tar.gz /tmp/backup-`date +"%Y%m%d"`
                rm -rf /tmp/backup-`date +"%Y%m%d"`
                mv backup-`date +"%Y%m%d"`.tar.gz $ORDERSTAT_ARC/
        fi
}

for OPT in A I O
do
        case $OPT in 
        A)
                archiveArc
        ;;
        I)
                invArc
        ;;
        O)
                orderArc
        ;;
        esac
done