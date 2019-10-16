
cd /root/dpdk/
git checkout $1 -f
sed -i 's/CONFIG_RTE_BUILD_COMBINE_LIBS=n/CONFIG_RTE_BUILD_COMBINE_LIBS=y/g' config/common_linuxapp
cd /root/ovs/deps/
rm -rf dpdk/
cp -r /root/dpdk .
cd dpdk/
make install T=x86_64-native-linuxapp-gcc
make install O=x86_64-native-linuxapp-gcc V=1
make -j2 && make install
./configure --with-dpdk=/root/ovs/deps/dpdk/x86_64-native-linuxapp-gcc
