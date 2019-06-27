# Troubleshooting

## Couldn't connect to Docker daemon at http+docker://localhost - is it running?
[Several fixes on GitHub](https://github.com/docker/compose/issues/4181)

## Enable dockerd API for Xdebug
#####From [success.docker.com](https://success.docker.com/article/how-do-i-enable-the-remote-api-for-dockerd)
After completing these steps, you will have enabled the remote API for dockerd, without editing the systemd unit file in place:

Create a file at /etc/systemd/system/docker.service.d/startup_options.conf with the below contents:

````
# /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376
````
`Note: The -H flag binds dockerd to a listening socket, either a Unix socket or a TCP port. You can specify multiple -H flags to bind to multiple sockets/ports. The default -H fd:// uses systemd's socket activation feature to refer to /lib/systemd/system/docker.socket.`

Reload the unit files:

````
$ sudo systemctl daemon-reload
````
Restart the docker daemon with new startup options:

````
$ sudo systemctl restart docker.service
````

Ensure that anyone that has access to the TCP listening socket is a trusted user since access to the docker daemon is root-equivalent.cStart=/usr/bin/dockerd -H fd:// -H tcp://0.0.0.0:2376