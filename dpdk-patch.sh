sed -i '2315 s/DEFAULT/NONE/g' drivers/net/i40e/i40e_ethdev.c
sed -i '2325 i\ \ \ \ \ \ \ \ i40e_aq_debug_write_global_register(hw, 0x0012A504, 0, NULL);' drivers/net/i40e/i40e_ethdev.c
sed -i '669 s/DEFAULT/NONE/g' drivers/net/i40e/i40e_ethdev_vf.c
sed -i '3821 i\\t\t\t\thw->mac.type != ixgbe_mac_82599EB &&' drivers/net/ixgbe/ixgbe_ethdev.c
sed -i '44 s/bin\/iccvars.sh/oneapi\/compiler\/2021.3.0\/env\/vars.sh/g' usertools/dpdk-setup.sh
sed -i '79 s/install/install -j/g' usertools/dpdk-setup.sh
