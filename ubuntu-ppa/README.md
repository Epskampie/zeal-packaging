Guide for Ubuntu packaging
==========================
General info: http://packaging.ubuntu.com/html/packaging-new-software.html
Debian guide (doesn't use bazaar, so command parameters are more correct): https://www.debian.org/doc/manuals/maint-guide/

Supporting new ubuntu version
=============================
http://packaging.ubuntu.com/html/getting-set-up.html#set-up-pbuilder
$ pbuilder-dist <release> create
    
Compiling to check it works before uploading
============================================
http://packaging.ubuntu.com/html/packaging-new-software.html#building-the-package
Comment out debuild, uploading etc in ppa-upload.sh
Enter source directory.
$ debuild -us -uc

If you have problems, try regenerating the debian directory:
https://blog.packagecloud.io/eng/2015/07/14/using-dh-make-to-prepare-debian-packages/
