Guide for Ubuntu packaging
==========================
Take a look at:
* https://blog.packagecloud.io/eng/2015/07/14/using-dh-make-to-prepare-debian-packages/
* man debhelper
* [Building Debian and Ubuntu packages with pbuilder](https://blog.packagecloud.io/eng/2015/05/18/building-deb-packages-with-pbuilder/)
* man pbuilder
* man debuild

Supporting new ubuntu version
=============================
https://blog.packagecloud.io/eng/2015/05/18/building-deb-packages-with-pbuilder/

    sudo pbuilder create \
        --distribution xenial \
        --architecture amd64 \
        --basetgz /var/cache/pbuilder/xenial-amd64-base.tgz
    
Compiling locally as a first test
=================================
Check depencies in the README: https://github.com/zealdocs/zeal

    git clone https://github.com/zealdocs/zeal
    cd zeal
    mkdir build && cd build
    cmake ..
    make

Clean compile to check it will work op ppa
==========================================
./clean_build_test.sh
Once the build has concluded, you will find the resulting files in: /var/cache/pbuilder/result/.
