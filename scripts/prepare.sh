#!/bin/bash

app="$APP_NAME"

if systemctl is-active --quiet $app; then
    echo "Stopping $app..."
    sudo systemctl stop $app
    sudo systemctl disable $app
    sudo rm /etc/systemd/system/$app.service
    echo "$app stopped."
else
    echo "$app is not running."
fi

if [ -d /var/www/$app ]; then
    echo "Removing /var/www/$app..."
    sudo rm -rf /var/www/$app
    echo "/var/www/$app removed."
else
    echo "/var/www/$app does not exist."
fi
