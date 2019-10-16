rm /usr/etc/openvswitch/conf.db
ovsdb-tool create /usr/etc/openvswitch/conf.db
ovsdb-server --remote=punix:/usr/var/run/openvswitch/db.sock --remote=db:Open_vSwitch,Open_vSwitch,manager_options --pidfile&
ps -a | grep ovsdb-server
