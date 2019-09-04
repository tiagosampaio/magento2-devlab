# Magento 2 DevStack
Magento 2 DevStack

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
