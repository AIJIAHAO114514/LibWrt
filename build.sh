#!/bin/bash
set -e

echo "========== 1/3 更新 feeds =========="
./scripts/feeds update -a
./scripts/feeds install -a

echo "========== 2/3 清理依赖 (defconfig) =========="
make defconfig

echo "========== 3/3 开始编译 =========="
make -j8 V=s

echo "========== 完成 =========="
ls -lh bin/targets/qualcommax/ipq60xx/*sysupgrade* 2>/dev/null || echo "请检查 bin 目录"
