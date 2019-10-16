ovs-vswitchd unix:/usr/var/run/openvswitch/db.sock --pidfile&ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-init=true
ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-lcore-mask="0x4"

ovs-vswitchd unix:/usr/var/run/openvswitch/db.sock --pidfile&
ps -a | grep ovs-vswitchd
