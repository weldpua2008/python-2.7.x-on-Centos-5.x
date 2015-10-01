#!/usr/bin/env bash
TEST_PYTHON="yes"
TEST_PIP="yes"

set -e

#if [ "${TEST_PYTHON}" == "yes" ];then
#    python2.7 --version
#fi

if [ "${TEST_PIP}" == "yes" ];then
    pip2.7 --version
fi

exit 0