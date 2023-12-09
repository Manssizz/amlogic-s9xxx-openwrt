#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (After Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# ------------------------------- Main source started -------------------------------
#
# Modify default theme（FROM uci-theme-bootstrap CHANGE TO luci-theme-material）
sed -i 's/luci-theme-bootstrap/luci-theme-material/g' ./feeds/luci/collections/luci/Makefile

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Set etc/openwrt_release
sed -i "s|DISTRIB_REVISION='.*'|DISTRIB_REVISION='R$(date +%Y.%m.%d)'|g" package/lean/default-settings/files/zzz-default-settings
echo "DISTRIB_SOURCECODE='lede'" >>package/lean/base-files/files/etc/openwrt_release

# Change Default Settings
sed -i "s/zh_cn/en/g" package/lean/default-settings/files/zzz-default-settings
sed "3,4d" package/lean/default-settings/files/zzz-default-settings
sed -i '5i opkg remove *zh-cn*' package/lean/default-settings/files/zzz-default-settings
sed -i 's/CST-8/UCT+7/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/Shanghai/Jakarta/g' package/lean/default-settings/files/zzz-default-settings
sed -i "s/uci set system.@system[0].timezone=CST-8/uci set system.@system[0].hostname=Cendrawasih\nuci set system.@system[0].timezone=WIB-7/g" package/lean/default-settings/files/zzz-default-settings

# Modify default IP（FROM 192.168.1.1 CHANGE TO 192.168.31.4）
# sed -i 's/192.168.1.1/192.168.31.4/g' package/lean/base-files/files/bin/config_generate

# Replace the default software source
# sed -i 's#openwrt.proxy.ustclug.org#mirrors.bfsu.edu.cn\\/openwrt#' package/lean/default-settings/files/zzz-default-settings
sed -i 's/mirrors.cloud.tencent.com/mirror.0x.sg/g' package/lean/default-settings/files/zzz-default-settings

# Add modem package
# sed -i '6i opkg install luci-app-modeminfo luci-app-modemband luci-app-3ginfo-lite luci-app-sms-tool-js' package/lean/default-settings/files/zzz-default-settings

#
# ------------------------------- Main source ends -------------------------------

# ------------------------------- Other started -------------------------------
#
# Add luci-app-amlogic
svn co https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic package/lean/luci-app-amlogic

# Add xmm-modem package
git clone https://github.com/lutfailham96/xmm-modem.git package/lean/xmm-modem

# Add Watch
# git clone https://github.com/tj/watch.git /package/lean/watch
# Add luci-app-advanced
# svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-advanced package/lean/luci-app-advanced

## Rooter by OfmodemSandman
git clone https://github.com/Manssizz/rmbim.git package/lean/rmbim
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/feeds/luci/modules/luci-mod-admin-full package/lean/luci-mod-admin-full
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/feeds/packages/net/zerotier package/lean/zerotier
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter/0drivers/rqmi package/lean/rqmi
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter/ext-rooter-basic package/lean/ext-rooter-basic
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter package/lean/rooter
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter/0basicsupport/ext-sms package/lean/ext-sms
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter/0basicsupport/ext-buttons package/lean/ext-buttons
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter/0optionalapps/ext-autoapn package/lean/ext-autoapn


## Theme for ROOter
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/feeds/luci/modules/luci-base package/luci-base
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter/0themes/ext-login package/lean/ext-login
#svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter/0themes/theme-data package/lean/theme-data
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter-extra/luci-theme-material package/lean/luci-theme-material
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter/0themes/ext-material package/lean/ext-material
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter/0themes/ext-theme package/lean/ext-theme
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter/0themes/luci-theme-argon package/lean/luci-theme-argon
svn co https://github.com/ofmodemsandmen/rootersource18/trunk/package/rooter/0themes/argon-config package/lean/argon-config
git clone https://github.com/Manssizz/theme-data.git package/lean/theme-data

# Add kiddin9 repository
# git clone https://github.com/4IceG/luci-app-3ginfo-lite.git package/lean/luci-app-3ginfo-lite
# git clone https://github.com/4IceG/luci-app-modemband.git package/lean/luci-app-modemband
# git clone https://github.com/4IceG/luci-app-sms-tool-js.git package/lean/luci-app-sms-tool-js
# git clone https://github.com/4IceG/luci-app-modeminfo.git package/lean/luci-app-modeminfo
# git clone https://github.com/Mike-qian/dns2tcp.git package/lean/dns2tcp

# svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-gobinetmodem package/lean/luci-app-gobinetmodem
# svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-mmconfig package/lean/luci-app-mmconfig

#svn co https://github.com/kiddin9/openwrt-packages/trunk/{luci-app-control-speedlimit} package/lean/luci-app-control-speedlimit
#svn co https://github.com/kiddin9/openwrt-packages/trunk/{luci-app-modemband,modemband} 
#svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-bypass package/lean/luci-app-bypass
#svn co https://github.com/kiddin9/openwrt-packages/trunk/rtl8189es package/lean/kernel/rtl8189es

# Add Argon Theme
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/lean/luci-theme-argon
# Fix runc version error
# rm -rf ./feeds/packages/utils/runc/Makefile
# svn export https://github.com/openwrt/packages/trunk/utils/runc/Makefile ./feeds/packages/utils/runc/Makefile


# coolsnowwolf default software package replaced with Lienol related software package
# rm -rf feeds/packages/utils/{containerd,libnetwork,runc,tini}
# svn co https://github.com/Lienol/openwrt-packages/trunk/utils/{containerd,libnetwork,runc,tini} feeds/packages/utils

# svn co https://github.com/libremesh/lime-packages/trunk/packages/{shared-state-pirania,pirania-app,pirania} package/lean/lime-packages/packages

# Add third-party software packages (The entire repository)
# git clone https://github.com/libremesh/lime-packages.git package/lean/lime-packages
# Add third-party software packages (Specify the package)
# svn co https://github.com/libremesh/lime-packages/trunk/packages/{shared-state-pirania,pirania-app,pirania} package/lean/lime-packages/packages
# Add to compile options (Add related dependencies according to the requirements of the third-party software package Makefile)
# sed -i "/DEFAULT_PACKAGES/ s/$/ pirania-app pirania ip6tables-mod-nat ipset shared-state-pirania uhttpd-mod-lua/" target/linux/armvirt/Makefile

# Apply patch
# git apply ../router-config/patches/{0001*,0002*}.patch --directory=feeds/luci
#
# ------------------------------- Other ends -------------------------------

