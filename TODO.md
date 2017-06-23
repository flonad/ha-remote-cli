Create self-signed certificate :
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes -subj '/CN=*.admin.cloud.mbs' && cat key.pem >> cert.pem

Start SSL server
socat openssl-listen:4001,reuseaddr,fork,bind=10.201.231.240,cert=cert.pem,cafile=client.crt UNIX-CLIENT:/var/run/haproxy.socket 

Connect over SSL
echo "show stat" | socat stdio openssl-connect:$HA_HOST:$HA_PORT,cert=client.pem,cafile=haproxy-remote.crt

# Install systemd service file if applicable for this system
	if test -x /usr/bin/systemctl && test -d "/etc/systemd/system"; then install -m0644 scripts/clatd.systemd /etc/systemd/system/clatd.service && systemctl daemon-reload; fi
	if test -e "/etc/systemd/system/clatd.service" && test ! -e "/etc/systemd/system/multi-user.target.wants/clatd.service"; then systemctl enable clatd.service; fi
