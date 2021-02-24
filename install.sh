#!/usr/bin/env bash
set -ex
cd $(dirname $(readlink -f $0))
buildout=${buildout:-buildout.cfg}
instance=${instance:-plone5}
zopeuser=${zopeuser:-zope}
[[ -z "${SKIP_BUILDOUT}" ]] && su $zopeuser -c "python bootstrap.py && bin/buildout -vvvvvvvvvvNc $buildout"
cp -fv etc/logrotate.conf /etc/logrotate.d/$instance
cp -fv etc/init.d/supervisor.initd /etc/init.d/supervisord.${instance}
update-rc.d -f supervisord.${instance} defaults 99
systemctl enable supervisord.${instance}
