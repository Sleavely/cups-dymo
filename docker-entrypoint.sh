#!/bin/bash

# Start cups
/usr/sbin/cupsd

# Install the printer
lpadmin -p dymo -v $(lpinfo -v | grep -o 'usb://DYMO.*$') -P /usr/share/cups/model/lw450.ppd

# Start the printer
cupsenable dymo

# Accept jobs to the printer
cupsaccept dymo

# Run our node server
node index.js
