#!/usr/bin/env bash
TEST_PYTHON="yes"
TEST_PIP="yes"
SOURCE="${BASH_SOURCE[0]}"
RDIR="$( dirname "$SOURCE" )"
BATS_TEST="${RDIR}/tests"


######################################
# Bats tests: https://github.com/sstephenson/bats
######################################
yum install -y git
git clone https://github.com/sstephenson/bats.git && cd bats && ./install.sh /usr/local || (echo "Bats wasn't installed";exit 1)

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