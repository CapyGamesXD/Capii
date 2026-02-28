#!/bin/bash
echo "Welcome to the Capii Installer! :D"
sleep 1
echo "Sit back and grab a snack while waiting for the install. :)"
sleep 1

sudo apt update
sudo apt install cog libgles2

sudo tee /etc/systemd/system/capiirun.service <<EOF

[Unit]
Description=The program to run Capii on startup

[Service]
ExecStart=cog https://capii.capydesigns.com

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable capiirun
echo "The system will now reboot and start your program on startup!"
sudo reboot