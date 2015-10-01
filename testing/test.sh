#!/usr/bin/env bash
TEST_PYTHON="yes"
TEST_PIP="yes"
SOURCE="${BASH_SOURCE[0]}"
RDIR="$( dirname "$SOURCE" )"
BATS_TEST="${RDIR}/tests"
ARCH=`uname -i`
PKG_NAME="rpmforge-release-0.5.2-2.el5.rf.${ARCH}.rpm"
RPMFORGE_URL="http://packages.sw.be/rpmforge-release/${PKG_NAME}"

######################################
# Bats tests: https://github.com/sstephenson/bats
######################################
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
wget ${RPMFORGE_URL}  --no-check-certificate || curl -L ${RPMFORGE_URL} --output ${PKG_NAME}

rpm -Uvh ${PKG_NAME}

yum update
yum install git -y
yum install git-gui -y
git clone https://github.com/sstephenson/bats.git && cd bats && ./install.sh /usr/local || (echo "Bats wasn't installed"; exit 1)

set -e
bats --tap ${BATS_TEST}

##if [ "${TEST_PYTHON}" == "yes" ];then
##    python2.7 --version
##fi
#
#if [ "${TEST_PIP}" == "yes" ];then
#    pip2.7 --version
#fi

exit 0