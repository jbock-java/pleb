build: init
	cp init system/init
	cd system && find . -not -path ./root/.bash_history | cpio -o --format=newc | gzip -9 > ../ramdisk.cpio.gz
