lcaflc/gandi.cli
================

[![](https://badge.imagelayers.io/lcaflc/gandi.cli:latest.svg)](https://imagelayers.io/?images=lcaflc/gandi.cli:latest 'Get your own badge on imagelayers.io')

Gandi.cli
---------

Gandi.cli is the command line tool used to manage from your shell you gandi account.

Official website: [http://cli.gandi.net/]().

Usage
-----

The image start a bash inside the container. Once the container fired up you simply use the gandi command just like you have done on your system.
```bash
docker run -it --rm lcaflc/gandi.cli
Gandi.cli:~# gandi --version
Gandi CLI 0.16

Copyright: © 2014-2015 Gandi S.A.S.
License: GPL-3
```

Gandi.cli need that you have some configuration done in order to connect to their API (private API key, default datacenter, API url, ...). This is so recommended to have a persistent container for your cli and you have 2 methods to configure those:
1. Start your container with a name and configure it using the gandi cli
```bash
docker run -it --name gandi.cli lcaflc/gandi.cli
Gandi.cli:~# gandi setup
...
```
2. Use a VOLUME to map your existing configuration to the container
```bash
docker run -it --name gandi.cli -v ~/.config/gandi:/root/.config/gandi lcaflc/gandi.cli
Gandi.cli:~# gandi account
handle           : XXXX-GANDI
credits          :
...
```

When you quit your container bash shell it will stop. To easily respawn into your configured container you only need to start it and attach input/outputs
```bash
docker start -ia gandi.cli
```

License
-------

This repo is published under the [GPLv3 License](http://opensource.org/licenses/GPL-3.0)
