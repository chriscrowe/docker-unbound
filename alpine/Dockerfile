FROM alpine:3.8

# Install unbound
RUN apk update
RUN apk add unbound wget

# Download the current root hints file (the list of primary root servers which are serving the domain "." - the root domain). Update it roughly every six months. Note that this file changes infrequently.
RUN wget -O /etc/unbound/root.hints https://www.internic.net/domain/named.root

# Run unbound hints update every 3 months at 3am
RUN (crontab -l; echo "0 3 1 */3 * wget -O /etc/unbound/root.hints https://www.internic.net/domain/named.root && service unbound restart" ) | crontab -

# Increase the max allowed receive buffer size
# RUN echo "net.core.rmem_max=1048576" >> /etc/sysctl.conf

# Copy server config
COPY unbound.conf /etc/unbound/unbound.conf

# Copy the run script and make it executable
# COPY run.sh /
# RUN chmod a+x /run.sh

# Expose 5353 for DNS queries
EXPOSE 5353

ENTRYPOINT [ "/usr/sbin/unbound","-d", "-v" ]