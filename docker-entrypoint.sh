#!/bin/bash

lpadmin -p dymo -v $(lpinfo -v | grep -o 'usb://DYMO.*$') -P /usr/share/cups/model/lw450.ppd

/usr/sbin/cupsd && node index.js
