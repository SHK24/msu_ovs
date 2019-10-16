./setup_dpdk_with_bind.sh
sleep 2
./ovs_db_init.sh
sleep 2
./start_vswitchd.sh
sleep 5
./setup_switch.sh
