#!/bin/bash

touch /etc/systemd/system/emk.service

echo '#!/bin/bash
    [Unit]
        After=network.target
        
        [Service]
Type=simple
User=root
Restart=always
ExecStart=/usr/bin/sh emk.sh
ExecStop=/bin/kill  ${MAINPID}

    [Install]
WantedBy=multi-user.target
Alias=emk.service' >> "/etc/systemd/system/emk.service"

cd 