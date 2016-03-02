lcaflc/gandi.cli
================


Gandi.cli
---------

Gandi.cli is the command line tool used to manage from your shell you gandi account.

Official website: [http://cli.gandi.net/]().

Features
--------

This image provide stable releases of the Gandi.cli as well as git master branch on official repo [https://github.com/Gandi/gandi.cli](). See the build logs for latest updates and more containers informations.

Below are the mappings:

| GitHub Branch | Docker Tag | Gandi.cli version | Dockerfile | Imagelayers |
| ------------- | ---------- | ----------------- | ---------- | ----------- |
| master        | latest     | git master branch | [master/Dockerfile](https://github.com/lcaflc/docker-gandi.cli/blob/master/Dockerfile) | [![](https://badge.imagelayers.io/lcaflc/gandi.cli:latest.svg)](https://imagelayers.io/?images=lcaflc/gandi.cli:latest 'Get your own badge on imagelayers.io') |
| 0.18          | 0.18       | stable 0.18       | [0.18/Dockerfile](https://github.com/lcaflc/docker-gandi.cli/blob/0.18/Dockerfile) | [![](https://badge.imagelayers.io/lcaflc/gandi.cli:0.18.svg)](https://imagelayers.io/?images=lcaflc/gandi.cli:0.17 'Get your own badge on imagelayers.io') |
| 0.17          | 0.17       | stable 0.17       | [0.17/Dockerfile](https://github.com/lcaflc/docker-gandi.cli/blob/0.17/Dockerfile) | [![](https://badge.imagelayers.io/lcaflc/gandi.cli:0.17.svg)](https://imagelayers.io/?images=lcaflc/gandi.cli:0.17 'Get your own badge on imagelayers.io') |
| 0.16          | 0.16       | stable 0.16       | [0.16/Dockerfile](https://github.com/lcaflc/docker-gandi.cli/blob/0.16/Dockerfile) | [![](https://badge.imagelayers.io/lcaflc/gandi.cli:0.16.svg)](https://imagelayers.io/?images=lcaflc/gandi.cli:0.16 'Get your own badge on imagelayers.io') |


Usage
-----

The image start a bash inside the container. Once the container fired up you simply use the gandi command just like you have done on your system.
```bash
docker run -it --rm lcaflc/gandi.cli
Gandi.cli:~# gandi --version
Gandi CLI 0.18

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
