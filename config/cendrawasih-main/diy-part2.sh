#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/openwrt/openwrt / Branch: main
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
#sed -i '5i opkg remove *zh-cn* luci-app-ssr-plus mmdvm-luci mmdvm-host libmmdv shadowsocks-rust-sslocal shadowsocks-rust-ssserver shadowsocksr-libev-ssr-check' package/lean/default-settings/files/zzz-default-settings
sed -i 's/CST-8/UCT+7/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/Shanghai/Jakarta/g' package/lean/default-settings/files/zzz-default-settings
sed -i "s/uci set system.@system[0].timezone=CST-8/uci set system.@system[0].hostname=Cendrawasih\nuci set system.@system[0].timezone=WIB-7/g" package/lean/default-settings/files/zzz-default-settings

# Add the default password for the 'root' user（Change the empty password to 'password'）
sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' package/base-files/files/etc/shadow

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/base-files/files/etc/openwrt_release
echo "DISTRIB_SOURCECODE='official'" >>package/base-files/files/etc/openwrt_release

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.31.4）
# sed -i 's/192.168.1.1/192.168.31.4/g' package/base-files/files/bin/config_generate
#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/luci-app-amlogic


### TurboACC
# git clone https://github.com/fullcone-nat-nftables/nft-fullcone.git package/nft-fullcone
# svn co https://github.com/chenmozhijin/turboacc/trunk/luci-app-turboacc package/luci-app-turboacc
svn co https://github.com/4IceG/luci-app-3ginfo-lite/trunk/luci-app-3ginfo-lite package/luci-app-3ginfo-lite
svn co https://github.com/chenmozhijin/turboacc/trunk/luci-app-turboacc package/luci-app-turboacc

# coolsnowwolf default software package replaced with Lienol related software package
# rm -rf feeds/packages/utils/{containerd,libnetwork,runc,tini}
# svn co https://github.com/Lienol/openwrt-packages/trunk/utils/{containerd,libnetwork,runc,tini} feeds/packages/utils

## Golang
rm -rf ./package/lang/golang
svn co https://github.com/openwrt/packages/trunk/lang/golang package/lang/golang

git clone https://github.com/Manssizz/rmbim.git package/rmbim

# QMI-Advance
git clone https://github.com/ddimension/qmi-advanced.git package/qmi-advanced

# Add third-party software packages (The entire repository)
# git clone https://github.com/libremesh/lime-packages.git package/lime-packages
# Add third-party software packages (Specify the package)
# svn co https://github.com/libremesh/lime-packages/trunk/packages/{shared-state-pirania,pirania-app,pirania} package/lime-packages/packages
# Add to compile options (Add related dependencies according to the requirements of the third-party software package Makefile)
# sed -i "/DEFAULT_PACKAGES/ s/$/ pirania-app pirania ip6tables-mod-nat ipset shared-state-pirania uhttpd-mod-lua/" target/linux/armvirt/Makefile

# Apply patch
# git apply ../config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# max conntrack
#sed -i 's/16384/65536/g' package/kernel/linux/files/sysctl-nf-conntrack.conf

# ------------------------------- Other ends -------------------------------
