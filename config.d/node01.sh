#!/bin/bash
#
# requires:
#  bash
#
set -e
set -o pipefail
set -x

# Do some changes ...

cat <<'EOS' > /etc/sysconfig/network-scripts/ifcfg-tap18
DEVICE=tap18
TYPE=Tap
BOOTPROTO=none
ONBOOT=yes
IPADDR=10.126.5.18
NETMASK=255.255.255.0
EOS

cat <<'EOS' > /etc/sysconfig/network-scripts/ifcfg-tap19
DEVICE=tap19
TYPE=Tap
BOOTPROTO=none
ONBOOT=yes
IPADDR=10.126.5.19
NETMASK=255.255.255.0
EOS

#

service network restart

#

cat <<EOS > /etc/httpd/conf.d/local-proxy.conf
<Proxy balnacer://dolphin-server>
  BalancerMember http://127.0.0.1:9004 loadfactor=100
  BalancerMember http://10.126.5.18:9004 loadfactor=1
  BalancerMember http://10.126.5.19:9004 loadfactor=1
</Proxy>

ProxyPass         /dolphin balnacer://dolphin-server
ProxyPassReverse  /dolphin balnacer://dolphin-server
EOS

#

service httpd restart
