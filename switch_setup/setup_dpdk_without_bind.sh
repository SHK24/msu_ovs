
export RTE_SDK=/root/ovs_mainline/deps/dpdk
export RTE_TARGET=x86_64-native-linuxapp-gcc

# Setup DPDK kernel modules
#cd /home/vagrant
sudo rmmod igb_uio.ko
sudo modprobe uio
sudo insmod $RTE_SDK/$RTE_TARGET/kmod/igb_uio.ko
sudo insmod $RTE_SDK/$RTE_TARGET/kmod/rte_kni.ko "lo_mode=lo_mode_ring"

# Add eth1 and eth2 interfaces to DPDK
#sudo ifconfig eth0 down
#sudo $RTE_SDK/usertools/dpdk-devbind.py -b igb_uio 00:04.0
#sudo ifconfig eth1 down
#sudo $RTE_SDK/usertools/dpdk-devbind.py -b igb_uio 00:04.1


(mount | grep hugetlbfs) > /dev/null || sudo mount -t hugetlbfs nodev /mnt/huge

sudo sysctl -w vm.nr_hugepages=2048
