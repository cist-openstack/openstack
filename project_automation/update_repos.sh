#!/bin/bash
sudo createrepo --update /var/www/html/repo/base/Packages
sudo createrepo --update /var/www/html/repo/centos-ceph-jewel
sudo createrepo --update /var/www/html/repo/centos-openstack-newon
sudo createrepo --update /var/www/html/repo/centos-qemu-ev
sudo createrepo --update /var/www/html/repo/extras/Packages
sudo createrepo --update /var/www/html/repo/updates/Packages/
