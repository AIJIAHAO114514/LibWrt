#!/bin/sh
# 编译前执行：把 PPPoE 账密注入到 network 配置
# 用法: sh inject-pppoe.sh

source ./pppoe-secrets.txt

sed -i \
  -e "s/YOUR_PPPOE_ACCOUNT/${PPPOE_USERNAME}/" \
  -e "s/YOUR_PPPOE_PASSWORD/${PPPOE_PASSWORD}/" \
  files/etc/config/network

echo "✅ PPPoE 账密已注入 files/etc/config/network"
