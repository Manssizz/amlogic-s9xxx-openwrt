#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/openwrt/openwrt / Branch: main
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
sed -i '$a src-git lienol https://github.com/kiddin9/openwrt-packages' feeds.conf.default
sed -i '$a src-git printing https://github.com/Vladdrako/openwrt-printing-packages' feeds.conf.default

# other
# rm -rf package/utils/{ucode,fbtest}

