#!/bin/bash

app="$APP_NAME"
port="$APP_PORT"

app_dir="/var/www/$app"

service_file="/etc/systemd/system/$app.service"

current_user=$(whoami)

sudo cat <<EOF | sudo tee $service_file
[Unit]
Description=$app App
After=network.target

[Service]
ExecStart=$app_dir/venv/bin/python -m flask run -h 0.0.0.0 -p $port
WorkingDirectory=$app_dir
Restart=always
User=$current_user

[Install]
WantedBy=multi-user.target
EOF
