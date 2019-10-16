
export RTE_SDK=/root/ovs/deps/dpdk
export RTE_TARGET=x86_64-native-linuxapp-gcc

# Setup DPDK kernel modules
cd /home/vagrant
sudo modprobe uio
sudo insmod $RTE_SDK/$RTE_TARGET/kmod/igb_uio.ko
sudo insmod $RTE_SDK/$RTE_TARGET/kmod/rte_kni.ko "lo_mode=lo_mode_ring"

# Add eth1 and eth2 interfaces to DPDK
#sudo ifconfig eth0 down
sudo $RTE_SDK/tools/dpdk_nic_bind.py -b igb_uio 00:04.0

(mount | grep hugetlbfs) > /dev/null || sudo mount -t hugetlbfs nodev /mnt/huge

sudo sysctl -w vm.nr_hugepages=2048
