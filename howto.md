# Where to put files

See the documentation [here](https://refspecs.linuxfoundation.org/FHS_3.0/fhs/index.html), TL;DR:

*   Put binaries in /usr/bin
*   Put jars in /usr/lib

# systemd

Lets you set things up to start on boot.

First, create a new service in `/etc/systemd/system`:

```
[Unit]
Description=catfeeder: runs the catfeeder server.

[Service]
Type=simple
ExecStart= /usr/bin/java -jar /usr/lib/catfeeder/backend_deploy.jar

[Install]
WantedBy=default.target
```

Then run the following commands to start the service:

1. `sudo systemctl enable <service>@<instance>`
2. `sudo systemctl start <service>@<instance>`

If you want to check the output of the executed program:

`sudo systemctl status <service>@<instance>.service`
