sed -i '2340 s/DEFAULT/NONE/g' drivers/net/i40e/i40e_ethdev.c
sed -i '2354 i\ \ \ \ \ \ \ \ i40e_aq_debug_write_global_register(hw, 0x0012A504, 0, NULL);' drivers/net/i40e/i40e_ethdev.c
sed -i '693 s/DEFAULT/NONE/g' drivers/net/i40e/i40e_ethdev_vf.c
sed -i '3871 i\\t\t\t\thw->mac.type != ixgbe_mac_82599EB &&' drivers/net/ixgbe/ixgbe_ethdev.c
sed -i '44 s/bin\/iccvars.sh/oneapi\/compiler\/2021.1.1\/env\/vars.sh/g' usertools/dpdk-setup.sh
