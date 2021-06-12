#!/bin/bash
set -eou pipefail
pushd /src/
git clone --depth=1 https://github.com/morrownr/8821au

pushd 8821au
./raspi32.sh
sed -i -E s/"^KSRC.+"//g Makefile
popd

LD=$CROSS_COMPILE-ld
mkdir -p /src/linux-headers-5.10.17-v7+/tools/include/tools/

wget -qO kbuild.patch https://patchwork.kernel.org/project/linux-kbuild/patch/c744107b341e487cf37139597a7775f6f62e12e8.1596702608.git.lukas@wunner.de/raw/
wget -q https://github.com/torvalds/linux/raw/master/tools/include/tools/{be_byteshift.h,le_byteshift.h}

pushd 8821au

for i in `ls -d1 /src/linux-*`; do
	export KSRC=`readlink -f $i`
	echo KSRC is $KSRC
	mkdir -p $KSRC/tools/include/tools/
	cp -v /src/*.h $KSRC/tools/include/tools/
	pushd $KSRC
		patch -f -p1 < ../kbuild.patch || true
		make -j`nproc` kbuild_install
	popd
	make -j`nproc`
	OUTPUT=/output/$(basename $KSRC | sed s/linux-headers-//)
	echo OUTPUT is $OUTPUT
	mkdir -p $OUTPUT
	mv -v *.ko $OUTPUT
	make clean
done
popd
