FROM node:12

RUN apt-get update \
  && apt-get install -y \
    cups \
    cups-client \
    printer-driver-dymo \
    usbutils

# For installing Dymo CUPS drivers manually
# RUN wget http://download.dymo.com/dymo/Software/Download%20Drivers/Linux/Download/dymo-cups-drivers-1.4.0.tar.gz \
#     && tar -xzf dymo-cups-drivers-1.4.0.tar.gz \
#     && mkdir -p /usr/share/cups/model \
#     && cp ./dymo-cups-drivers-1.4.0.5/ppd/lw450.ppd /usr/share/cups/model/ \
#     && rm -rf ./dymo-cups-drivers-1.4.0.5 \
#     && rm -rf ./dymo-cups-drivers-1.4.0.tar.gz

COPY . /app/
WORKDIR /app/

### Start CUPS instance ###
# RUN /usr/sbin/cupsd -f -c /etc/cups/cupsd.conf

# Expose SMB printer sharing
EXPOSE 137/udp 139/tcp 445/tcp

# Expose IPP printer sharing
EXPOSE 631/tcp

# Expose avahi advertisement
EXPOSE 5353/udp

# Start CUPS instance
CMD /usr/sbin/cupsd && node index.js
