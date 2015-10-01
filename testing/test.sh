#!/usr/bin/env bash
TEST_PYTHON="yes"
TEST_PIP="yes"
SOURCE="${BASH_SOURCE[0]}"
RDIR="$( dirname "$SOURCE" )"
BATS_TEST="${RDIR}/tests"


######################################
# Bats tests: https://github.com/sstephenson/bats
######################################
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
rpm -i http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.`uname -i`.rpm
#yum update
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