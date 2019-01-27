FROM ubuntu:18.04

# Install unbound
RUN apt update
RUN apt install -y unbound wget vim

# Download the current root hints file (the list of primary root servers which are serving the domain "." - the root domain). Update it roughly every six months. Note that this file changes infrequently.
RUN wget -O root.hints https://www.internic.net/domain/named.root
RUN mv root.hints /var/lib/unbound/

# Increase the max allowed receive buffer size
# RUN echo "net.core.rmem_max=1048576" >> /etc/sysctl.conf

# Copy server config
COPY unbound.conf /etc/unbound/unbound.conf.d/default.conf

# Copy the run script and make it executable
COPY run.sh /
RUN chmod a+x /run.sh

# Expose 5353 for DNS queries
EXPOSE 5353

CMD [ "/run.sh" ]