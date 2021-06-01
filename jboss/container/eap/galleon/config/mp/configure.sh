#!/bin/sh
# Configure module
set -e

SCRIPT_DIR=$(dirname $0)
ARTIFACTS_DIR=${SCRIPT_DIR}/artifacts

chown -R jboss:root $SCRIPT_DIR
chmod -R ug+rwX $SCRIPT_DIR

pushd ${ARTIFACTS_DIR}
cp -pr * /
popd

# Copy launch-config that contains microprofile launch scripts

SCRIPTS_DIR=${SCRIPT_DIR}/scripts

mkdir -p ${JBOSS_HOME}/bin/launch

cp -p ${SCRIPTS_DIR}/launch/* ${JBOSS_HOME}/bin/launch

#Ensure permissions
chown -R jboss:root ${JBOSS_HOME}/bin/
chmod -R g+rwX ${JBOSS_HOME}/bin/launch/
