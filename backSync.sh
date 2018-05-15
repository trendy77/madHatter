#! /bin/bash
BACKDEST="/root/Dropbox/kaliBackup/$(hostname -s)"
HOST=kaliHub
cd $BACKDEST
# /etc/apt/sources.lists.d/<EVERTYHING IN THIS FOLDER>
# cp -uR /etc/apt/sources.list.d $BACKDEST/etc/apt/sources.list.d
# handshakes folder

# Directories to backup
backup_me="/etc /home/t /var/named /var/log /root"

# Check and create backup directory
backup_date=`date +%Y_%m_%d_%H_%M`
backup_dir=${BACKDEST}/fs_${backup_date}
mkdir -p $backup_dir

# Perform backup
for directory in $backup_me
do
    archive_name=`echo ${directory} | sed s/^\\\/// | sed s/\\\//_/g`
    tar pcfzP ${backup_dir}/${archive_name}.tgz ${directory} 2>&1 | tee > ${backup_dir}/${archive_name}.log
done
# copy the bash_aliases + bashhistory
# -u -- only if updated
#       ~/.ssh? folders
#       cp /etc/hosts & hostname files
