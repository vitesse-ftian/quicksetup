#!/bin/bash

# locale en_US.UTF-8 has an alias.
sudo locale-gen en_US.utf8 
# Start ssh
sudo service ssh start

# Some fixes for mluser setting
echo ". /opt/ml-suite/overlaybins/setup.sh $PLATFORM" >> ~/.bashrc
echo ". /home/mluser/quicksetup/u16.alveo/deepgreendb/greenplum_path.sh" >> ~/.bashrc
{ ssh-keyscan localhost; ssh-keyscan 0.0.0.0; } >> /home/mluser/.ssh/known_hosts

# Create database.
(cd /home/mluser/quicksetup/u16.alveo && bash 03_initdb.sh)
(cd /home/mluser/quicksetup/u16.alveo && bash 04_xdrive.sh)
(cd /home/mluser/quicksetup/u16.alveo && bash 05_sql.sh)

# Start yet another shell for interactive work.
bash
