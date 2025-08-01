#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/openwrt/openwrt / Branch: main
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# sed -i '$a src-git modemfeed https://github.com/koshev-msk/modemfeed.git' feeds.conf.default
sed -i '$a src-git at https://github.com/4IceG/luci-app-atinout-mod.git' feeds.conf.default
# sed -i '$a src-git xmm https://github.com/lutfailham96/xmm-modem.git' feeds.conf.default
sed -i '$a src-git additional https://github.com/NueXini/NueXini_Packages.git;main' feeds.conf.default
sed -i '$a src-git mihomo https://github.com/morytyann/OpenWrt-mihomo.git;main' feeds.conf.default
# sed -i '$a src-git filebrowser https://github.com/xiaozhuai/luci-app-filebrowser.git' feeds.conf.default
sed -i '$a src-git nikki https://github.com/nikkinikki-org/OpenWrt-nikki.git;main' feeds.conf.default
# sed -i '$a src-git tailscale https://github.com/asvow/luci-app-tailscale' feeds.conf.default


# sed -i '$a src-git openmptcprouter https://github.com/Ysurac/openmptcprouter-feeds.git' feeds.conf.default

# other
# rm -rf package/utils/{ucode,fbtest}

