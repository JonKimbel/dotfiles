# systemd

Lets you set things up to start on boot.

First, create a new service in `~/.config/systemd/user/<service>@.service`:

```
[Unit]
Description=catfeeder: runs the catfeeder server.

[Service]
Type=simple
ExecStart= sudo java -jar ~/backend_deploy.jar

[Install]
WantedBy=default.target
```

Then run the following commands to start the service:

1. Run `systemctl --user enable <service>@<instance>`
2. Run `systemctl --user start <service>@<instance>`
