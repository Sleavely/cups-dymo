docker run -d \
  -p 631:631 \
  --privileged \
  -v //var/run/dbus:/var/run/dbus \
  -v //dev/bus/usb:/dev/bus/usb \
  --name cups-dymo \
  sleavely/cups-dymo
