build: init
	cp init system/init
	cd system && find . | cpio -o --format=newc | gzip -9 > ../ramdisk.cpio.gz
