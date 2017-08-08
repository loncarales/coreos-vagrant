#/bin/bash
set -e

DEST_FOLDER=/opt/pypy
BIN_FOLDER=/opt/bin

# create pypy dir
sudo mkdir -p $DEST_FOLDER
# create bin directory
sudo mkdir -p $BIN_FOLDER

# change to dest directory
cd $DEST_FOLDER

# Download Portable PyPy binaries
PYPY_VERSION=5.8-1
PYPY_FOLDER=$DEST_FOLDER/pypy-5.8-linux_x86_64-portable

if [ ! -d "$PYPY_FOLDER" ]; then
    sudo wget -O - https://bitbucket.org/squeaky/portable-pypy/downloads/pypy-$PYPY_VERSION-linux_x86_64-portable.tar.bz2 | sudo tar -xjf -
fi

# install pip
sudo $PYPY_FOLDER/bin/pypy -m ensurepip

# symlink python
sudo ln -sf $PYPY_FOLDER/bin/pypy $BIN_FOLDER/python
# symlink pip
sudo ln -sf $PYPY_FOLDER/bin/pip $BIN_FOLDER/pip

# test python
$BIN_FOLDER/python --version
# test pip
$BIN_FOLDER/pip --version
