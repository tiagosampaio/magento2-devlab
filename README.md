# Magento 2 DevLab

Magento 2 DevLab

[![Build Status](https://travis-ci.org/tiagosampaio/magento2-devstack.svg?branch=master)](https://travis-ci.org/tiagosampaio/magento2-devstack)

## First Steps

Using this environment is really simple. Please follow the instructions below.

Clone this repository in some directory on your machine using git:

```bash
$ git clone git@github.com:tiagosampaio/magento2-devlab.git
```

Or by downloading it directly:

```bash
$ curl -L https://github.com/tiagosampaio/magento2-devlab/archive/master.zip -o [path to directory]
```

Let's say you downloaded the project to the directory `~/docker/magento2-devlab`. Move on to the directory where you just downloaded this repository:

```bash
$ cd ~/docker/magento2-devlab
```

All of the helper scripts reside in the `bin` directory in the root directory of the project and they need to have execution permissions to be executed:

```bash
$ chmod +x ~/docker/magento2-devlab/bin/*
```

In the project's root directory just run:

```bash
$ bin/setup
```

## Dependencies

This project depends on the following services:

|Dependency|Required Version|
|----|----|
| Docker Engine | `>= v19.00.0` |
| Docker Compose | `>= v1.14.0` |

## XDebug Hack for MacOS

On your MacOS terminal run:

```
sudo ifconfig lo0 alias 10.254.254.254
```

Inside PHP Docker container edit the following file:

```bash
> vim /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
```

And set this configuration.

```
xdebug.remote_host=10.254.254.254
```
