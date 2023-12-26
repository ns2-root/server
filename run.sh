#!/bin/bash

mv emk.service /etc/systemd/system/

cd /etc/systemd/system/

chmod +x emk.service

cp emk.service -r /etc/systemd/system/multi-user.target.wants/

cd /etc/systemd/system/multi-user.target.wants/

chmod +x emk.service

cd 

cd server

mv emk.sh /usr/bin/

cd /usr/bin/

chmod +x emk.sh

systemctl daemon-reload