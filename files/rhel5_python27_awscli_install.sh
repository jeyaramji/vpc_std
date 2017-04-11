#!/bin/bash
# script to install python 2.7.5,pip,awscli in isolated env#
# https://gist.github.com/openprojdev/6123768#file-gistfile1-sh-L16#
exec 1> /tmp/$0.stdout_log
exec 2> /tmp/$0.stderr_log
#setup build essentials
#yum install -y gcc gdbm-devel readline-devel ncurses-devel zlib-devel bzip2-devel sqlite-devel db4-devel openssl-devel tk-devel bluez-libs-devel
wget -q http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz
tar zxvf Python-2.7.5.tgz
cd Python-2.7.5
./configure --prefix=/usr/local/python27 --enable-shared
make altinstall
echo "/usr/local/python27/lib" >> /etc/ld.so.conf.d/usr-python27.conf

/sbin/ldconfig
ln -s /usr/local/python27/bin/python2.7 /usr/bin/python27

#install setuptools
wget -q --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-0.9.8.tar.gz
tar zxvf setuptools-0.9.8.tar.gz
cd setuptools-0.9.8
/usr/bin/python27 setup.py install --prefix=/usr/local/python27/

#setup virtualenv
/usr/local/python27/bin/easy_install virtualenv

cd ..
#install pip
wget -q  https://pypi.python.org/packages/source/p/pip/pip-1.4.tar.gz
tar zxvf pip-1.4.tar.gz
cd pip-1.4
/usr/bin/python27 setup.py install --prefix=/usr/local/python27/

#install AWSCLI
/usr/local/python27/bin/pip install awscli

#Installed packages version #
echo "##########"
/usr/bin/python27 -V
/usr/local/python27/bin/aws --version
echo "##########"

#create and activate virtualenv
#/usr/local/python27/bin/virtualenv /usr/local/python27/env
#source /usr/local/python27/env/bin/activate
