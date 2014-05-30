Apache mod-proxy-balancer Test Verification Box
===============================================

System Requirements
-------------------

+ [Vagrant](http://www.vagrantup.com/downloads.html)
+ [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

Getting Started
---------------

```
$ vagrant up
```

```
$ (ipaddr=10.126.5.18 port=9004; while date; do nc -l ${ipaddr} ${port} < <(echo ${ipaddr}:${port}; echo); done) >/dev/null &
$ (ipaddr=10.126.5.19 port=9004; while date; do nc -l ${ipaddr} ${port} < <(echo ${ipaddr}:${port}; echo); done) >/dev/null &
$ (ipaddr=127.0.0.1   port=9004; while date; do nc -l ${ipaddr} ${port} < <(echo ${ipaddr}:${port}; echo); done) >/dev/null &
```

```
$ for i in {1..10}; do curl -fsSkL http://localhost/dolphin; usleep 0.5; done
```

License
-------

[Beerware](http://en.wikipedia.org/wiki/Beerware) license.

If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.
