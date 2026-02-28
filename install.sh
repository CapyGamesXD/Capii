#!/bin/bash
set -e

echo "Installing Capii! :D"

sudo apt update
sudo apt install -y cog libgles1 libgles2

sudo tee /etc/systemd/system/capii.service > /dev/null <<EOF
[Unit]
Description=Kiosk
After=network.target

[Service]
Type=simple
User=devpi
Environment=XDG_RUNTIME_DIR=/run/user/1000
ExecStartPre=/bin/sleep 15
ExecStart=/usr/bin/cog https://capii.capydesigns.com
Restart=always

[Install]
WantedBy=default.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable capii

echo "SUCCESS! Capii will now run on every boot. :)"
echo "System will now reboot to test changes!"
sudo reboot