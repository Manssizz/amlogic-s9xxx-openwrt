#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# Nuexini
sed -i '$a src-git nuexini https://github.com/NueXini/NueXini_Packages.git' feeds.conf.default

# kiddin9
#sed -i '$a src-git kiddin9 https://github.com/kiddin9/openwrt-packages.git' feeds.conf.default
# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}

