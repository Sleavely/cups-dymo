#!/bin/bash

# Start cups
/usr/sbin/cupsd

# Install the printer
lpadmin -p dymo -v $(lpinfo -v | grep -o 'usb://DYMO.*$') -P /usr/share/cups/model/lw450.ppd

# Start the printer
cupsenable dymo

# Accept jobs to the printer
cupsaccept dymo

# Set the printer as default
lpoptions -d dymo

# Set the size of labels used; this is a return address label (1" x 2 1/8")
lpoptions -o media=w72h154

# Run our node server
node index.js
