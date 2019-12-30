FROM node:12

RUN apt-get update \
  && apt-get install -y \
    cups \
    cups-client \
    printer-driver-dymo \
    usbutils

# The printer setup requires an appropriate PostScript Printer Definition (PPD) file.
# Unfortunately, this seems not to be part of the installation package.
# For this reason, we need to manually download the CUPS driver provided by Dymo.
RUN wget http://download.dymo.com/dymo/Software/Download%20Drivers/Linux/Download/dymo-cups-drivers-1.4.0.tar.gz \
    && tar -xzf dymo-cups-drivers-1.4.0.tar.gz \
    && mkdir -p /usr/share/cups/model \
    && cp ./dymo-cups-drivers-1.4.0.5/ppd/lw450.ppd /usr/share/cups/model/ \
    && rm -rf ./dymo-cups-drivers-1.4.0.5 \
    && rm -rf ./dymo-cups-drivers-1.4.0.tar.gz

COPY . /app/
WORKDIR /app/

# Expose SMB printer sharing
EXPOSE 137/udp 139/tcp 445/tcp

# Expose IPP printer sharing
EXPOSE 631/tcp

# Expose avahi advertisement
EXPOSE 5353/udp

# Expose Dymo printer web service port
EXPOSE 41951

# Start CUPS instance
CMD ./docker-entrypoint.sh
