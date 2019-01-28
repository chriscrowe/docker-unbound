# docker-unbound

### Unbound DNS resolver in Docker

An [Unbound](https://nlnetlabs.nl/projects/unbound/about/) server running in Docker. Useful when used in conjunction with Pi-Hole.

##### Details:

- Exposes port `5353` for DNS queries
- Auto-updates the list of primary root servers every 3 months
- Supports DNSSEC

##### Usage:

```bash
docker build . -t unbound
```

###### Run with host networking

```bash
docker run -d --net=host unbound
```
##### OR

###### Expose a port

```bash
docker run -d -p 5353:5353 unbound
```

##### References:

  - [https://docs.pi-hole.net/guides/unbound/](https://docs.pi-hole.net/guides/unbound/)
  - [https://nlnetlabs.nl/projects/unbound/about/](https://nlnetlabs.nl/projects/unbound/about/)
  - [https://www.reddit.com/r/pihole/comments/airlii/into_the_pihole_you_should_go/](https://www.reddit.com/r/pihole/comments/airlii/into_the_pihole_you_should_go/_)