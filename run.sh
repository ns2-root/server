#!/bin/bash

mv emk.service /etc/systemd/system/

chmod +x emk.service

cp emk.service -r /etc/systemd/system/multi-user.target.wants/

chmod +x emk.service

mv emk.sh /usr/bin/

chmod +x emk.sh

systemctl daemon-reload