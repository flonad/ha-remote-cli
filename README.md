ha-remote-cli
-------------

#### What's that 

This tool connects to an haproxy socket exposed over ssl using socat.

You can expose HAproxy socket with these commands :
```
EXPOSED_PORT=4001
HAPROXY_SOCKET=/var/run/haproxy.socket
IP_ADDR=127.0.0.1
socat openssl-listen:$EXPOSED_PORT,reuseaddr,fork,bind=$IP_ADDR,cert=cert.pem,cafile=client.crt UNIX-CLIENT:$HAPROXY_SOCKET 
```

#### Installation

```
make install
```

#### Configuration

You need to set up these environments variables:
```
HA_HOST
HA_PORT
```

Add your client certificate and the server CA in the configuration directory
```
/usr/local/etc/ha-remote-cli/certs/ha-remote-cli.pem
/usr/local/etc/ha-remote-cli/certs/ha-remote-server.crt
```

#### TODO

* Use a configuration file to select the HAproxy instance to connect
* Ability to use any command on the socket
