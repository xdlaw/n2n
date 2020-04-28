#!/bin/bash
git clone https://github.com/ntop/n2n.git
cd n2n
./autogen.sh
./configure
make

# optionally install
make install

cp packages/etc/systemd/system/edge.service.in /etc/systemd/system/edge.service
cp packages/etc/systemd/system/edge-ntopng@.service.in /etc/systemd/system/edge-ntopng@.service
cp packages/etc/systemd/system/edge@.service.in /etc/systemd/system/edge@.service
cp packages/etc/systemd/system/supernode.service.in /etc/systemd/system/supernode.service
cp packages/etc/n2n /etc/ -r

useradd n2n
systemctl daemon-reload
