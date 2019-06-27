<h1 align="center">mmularski/magento2-docker</h1> 

<div align="center">
  <p>Docker Configuration for Magento</p>
  <img src="https://img.shields.io/badge/magento-2.X-brightgreen.svg?logo=magento&longCache=true&style=flat-square" alt="Supported Magento Versions" />
</div>

## Table of contents

- [Usage](#usage)
- [Prerequisites](#prerequisites)
- [Quick Setup](#quick-setup)
- [Credits](#credits)
- [License](#license)

## Docker Hub

View Dockerfiles:


## Usage

This configuration is intended to be used as a Docker-based development environment for Magento 2.

Folders:

- `images`: Docker images for nginx and php
- `compose`: sample setups with Docker Compose


## Prerequisites

This setup assumes you are running Docker on a computer with at least 4GB of allocated RAM, a dual-core, and an SSD hard drive. [Download & Install Docker Community Edition](https://www.docker.com/community-edition#/download).

This configuration has been tested on Mac & Linux.

> **Windows Configurations**: The Windows configuration does not currently work and is in need of a contributor to get functional.

## Quick Setup

### Automated Setup (New Project)

> macOS & Linux Only

Run this automated one-liner from the directory you want to install your project to:

```bash
curl -s https://raw.githubusercontent.com/mmularski/magento2-docker/master/lib/onelinesetup | bash -s -- mm.magento2.local 2.3.2
```

The `magento2.test` above defines the hostname to use, and the `2.3.1` defines the Magento version to install. Note that since we need a write to `/etc/hosts` for DNS resolution, you will be prompted for your system password during setup.

After the one-liner above completes running, you should be able to access your site at `https://magento2.test`.

### Manual Setup

Same result as the one-liner above. Just replace `magento2.test` references with the hostname that you wish to use.

### Redis

Redis is now the default cache and session storage engine, and is automatically configured & enabled on new installs.

Use the following lines to enable Redis on existing installs:

**Enable for Cache:**

`bin/magento setup:config:set --cache-backend=redis --cache-backend-redis-server=redis --cache-backend-redis-db=0`

**Enable for Full Page Cache:**
`bin/magento setup:config:set --page-cache=redis --page-cache-redis-server=redis --page-cache-redis-db=1`

**Enable for Session:**

`bin/magento setup:config:set --session-save=redis --session-save-redis-host=redis --session-save-redis-log-level=4 --session-save-redis-db=2`

You may also monitor Redis by running: `bin/redis redis-cli monitor`

For more information about Redis usage with Magento, <a href="https://devdocs.magento.com/guides/v2.3/config-guide/redis/redis-session.html" target="_blank">see the DevDocs</a>.

### Xdebug & PHPStorm

-

## Credits

-

### Nexcess

A special thanks goes out to Mark Shust!

## License

[MIT](https://opensource.org/licenses/MIT)
