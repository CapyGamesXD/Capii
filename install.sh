#!/bin/bash
echo "Welcome to the Capii Installer! :D"
sleep 1
echo "This will take ~5m, so just sit back and grab a snack while waiting for the install. 😄"
sleep 2

sudo apt update
sudo apt install cog libgles2

sudo tee /etc/systemd/system/capiirun.service <<EOF

[Unit]
Description=The program to run Capii on startup
After=network-online.target
Wants=network-online.target

[Service]
User=$USER
Environment=XDG_RUNTIME_DIR=/run/user/$(id -u)
ExecStart=cog https://capii.capydesigns.com

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable capiirun
echo "The program will now be run! :D!"
sleep 1
sudo systemctl start capiirun