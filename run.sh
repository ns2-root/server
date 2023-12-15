#!/bin/bash

cd /etc/systemd/system/

nano ns2.service

echo '#!/bin/bash
    [Unit]
        After=network.target
        
        [Service]
Type=simple
User=root
Restart=always
ExecStart=/usr/bin/sh main.sh
ExecStop=/bin/kill  ${MAINPID}

    [Install]
WantedBy=multi-user.target
Alias=ns2.service' >> "/etc/systemd/system/ns2.service"

cd 