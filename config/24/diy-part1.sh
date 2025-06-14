#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/openwrt/openwrt / Branch: main
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

sed -i '$a src-git modemfeed https://github.com/koshev-msk/modemfeed.git' feeds.conf.default
sed -i '$a src-git additional https://github.com/solarflows/openwrt-packages.git' feeds.conf.default
# sed -i '$a src-git mihomo https://github.com/morytyann/OpenWrt-mihomo.git;main' feeds.conf.default
# sed -i '$a src-git neko https://github.com/nosignals/openwrt-neko.git;main' feeds.conf.default

# sed -i '$a src-git openmptcprouter https://github.com/Ysurac/openmptcprouter-feeds.git' feeds.conf.default

# other
# rm -rf package/utils/{ucode,fbtest}

