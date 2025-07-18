# Setup the server

The server only really needs Docker to build all the applications.

```shell
chown root:root /root/{.,.ssh/,.ssh/authorized_keys}
chmod u+rwX,go-rwX,-t /root/{.ssh/,.ssh/authorized_keys}
chmod go-w /root/
```
