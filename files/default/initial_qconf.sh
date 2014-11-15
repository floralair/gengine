#!/bin/sh
source /uge/root/default/common/settings.sh
qconf -mattr queue shell /bin/sh all.q
touch /uge/root/initial_qconf.done
