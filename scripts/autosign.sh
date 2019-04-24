#!/bin/bash
#
# a test script for policy based autosigning in puppet
#
# this script logs the certname and the CN from the CSR
# via syslog to local3.info. on centos7 this lands in
# /var/log/messages.
#
# $1 gets passed by the puppet master and is the certname of the agent
# the CSR is passed on STDIN

set -eof pipefail

export PATH=/bin:/sbin

readonly CERTNAME=$1
readonly CSR=$(cat -)
readonly CN=$(echo "${CSR}" | openssl req -noout -text | grep CN)

logger -p local3.info "received csr for host ${CERTNAME}"
logger -p local3.info "Common Name in CSR: ${CN}"

exit 0
