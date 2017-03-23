#version=DEVEL
# Install OS instead of upgrade
install
# Keyboard layouts
keyboard 'us'
# Root password
rootpw --iscrypted $6$Z6cN83JPLKn..VhN$VyFUSJDdXqRsdpzXeIs7ZIkRPjKpVI.nvQ9m.ABTUkWOQry8Wa9kEK8B37epXrBibJ0bHl80WAdylOxQpbGXX1
# System language
lang en_US
# Use CDROM installation media
cdrom
# SELinux configuration
selinux --disabled


# System timezone
timezone America/New_York
# System bootloader configuration
bootloader --location=none
# Clear the Master Boot Record
zerombr
# Partition clearing information
clearpart --linux

%packages
GeoIP
ModemManager-glib
MySQL-python
NetworkManager
NetworkManager-glib
NetworkManager-libnm
NetworkManager-team
NetworkManager-tui
NetworkManager-wifi
OpenIPMI-modalias
PyPAM
PyYAML
abattis-cantarell-fonts
acl
adwaita-cursor-theme
adwaita-gtk2-theme
adwaita-icon-theme
aic94xx-firmware
alsa-firmware
alsa-lib
alsa-tools-firmware
apr
apr-util
at-spi2-atk
at-spi2-core
atk
atlas
attr
audit
audit-libs
audit-libs-python
augeas-libs
authconfig
autogen-libopts
avahi-libs
basesystem
bash
bash-completion
bind-libs-lite
bind-license
binutils
biosdevname
blas
boost-filesystem
boost-program-options
boost-system
boost-thread
bootswatch-common
bridge-utils
btrfs-progs
bzip2
bzip2-libs
ca-certificates
cairo
cairo-gobject
cdparanoia-libs
celt051
centos-logos
centos-release
centos-release-openstack-liberty
checkpolicy
chkconfig
chrony
colord-libs
conntrack-tools
coreutils
cpio
cracklib
cracklib-dicts
cronie
cronie-anacron
crontabs
crudini
cryptsetup
cryptsetup-libs
cups-libs
curl
cyrus-sasl
cyrus-sasl-lib
cyrus-sasl-md5
dbus
dbus-glib
dbus-libs
dbus-python
dbus-x11
dconf
desktop-file-utils
device-mapper
device-mapper-event
device-mapper-event-libs
device-mapper-libs
device-mapper-persistent-data
dhclient
dhcp-common
dhcp-libs
dibbler-client
diffutils
dmidecode
dnsmasq
dnsmasq-utils
dosfstools
dracut
dracut-config-rescue
dracut-network
e2fsprogs
e2fsprogs-libs
ebtables
elfutils-libelf
elfutils-libs
emacs-filesystem
enchant
epel-release
erlang
erlang-asn1
erlang-compiler
erlang-cosEvent
erlang-cosEventDomain
erlang-cosFileTransfer
erlang-cosNotification
erlang-cosProperty
erlang-cosTime
erlang-cosTransactions
erlang-crypto
erlang-diameter
erlang-edoc
erlang-eldap
erlang-erl_docgen
erlang-erl_interface
erlang-erts
erlang-eunit
erlang-gs
erlang-hipe
erlang-ic
erlang-inets
erlang-jinterface
erlang-kernel
erlang-mnesia
erlang-odbc
erlang-orber
erlang-os_mon
erlang-ose
erlang-otp_mibs
erlang-parsetools
erlang-percept
erlang-public_key
erlang-runtime_tools
erlang-sasl
erlang-sd_notify
erlang-snmp
erlang-ssh
erlang-ssl
erlang-stdlib
erlang-syntax_tools
erlang-tools
erlang-xmerl
ethtool
exempi
expat
facter
file
file-libs
filesystem
findutils
fipscheck
fipscheck-lib
firewalld
firewalld-filesystem
flac-libs
fltk
fontconfig
fontpackages-filesystem
freetype
fuse
fuse-libs
fxload
galera
gawk
gdbm
gdisk
gdk-pixbuf2
genisoimage
geoclue2
gettext
gettext-libs
giflib
git
glib-networking
glib2
glibc
glibc-common
glusterfs
glusterfs-api
glusterfs-client-xlators
glusterfs-libs
gmp
gnome-boxes
gnome-icon-theme
gnome-python2
gnome-python2-canvas
gnome-themes-standard
gnupg2
gnutls
gnutls-dane
gnutls-utils
gobject-introspection
gperftools-libs
gpg-pubkey
gpgme
gpm-libs
graphite2
grep
groff-base
grub2
grub2-tools
grubby
gsettings-desktop-schemas
gsm
gssproxy
gstreamer1
gstreamer1-plugins-base
gtk-vnc2
gtk2
gtk3
gvnc
gzip
hardlink
harfbuzz
harfbuzz-icu
hicolor-icon-theme
hiera
hivex
hostname
httpd-tools
hunspell
hunspell-en-US
hwdata
info
initscripts
ipmitool
iproute
iprutils
ipset
ipset-libs
iptables
iptables-services
iputils
ipxe-roms-qemu
irqbalance
iscsi-initiator-utils
iscsi-initiator-utils-iscsiuio
iso-codes
ivtv-firmware
iwl100-firmware
iwl1000-firmware
iwl105-firmware
iwl135-firmware
iwl2000-firmware
iwl2030-firmware
iwl3160-firmware
iwl3945-firmware
iwl4965-firmware
iwl5000-firmware
iwl5150-firmware
iwl6000-firmware
iwl6000g2a-firmware
iwl6000g2b-firmware
iwl6050-firmware
iwl7260-firmware
iwl7265-firmware
jansson
jasper-libs
jbigkit-libs
jemalloc
json-c
json-glib
kbd
kbd-legacy
kbd-misc
keepalived
kernel
kernel-tools
kernel-tools-libs
kexec-tools
keyutils
keyutils-libs
kmod
kmod-libs
kpartx
krb5-libs
lapack
lcms2
ldns
less
libICE
libSM
libX11
libX11-common
libXau
libXcomposite
libXcursor
libXdamage
libXdmcp
libXevie
libXext
libXfixes
libXfont
libXft
libXi
libXinerama
libXmu
libXpm
libXrandr
libXrender
libXt
libXtst
libXv
libXxf86misc
libXxf86vm
libacl
libaio
libarchive
libart_lgpl
libassuan
libasyncns
libattr
libbasicobjects
libblkid
libcacard
libcap
libcap-ng
libcgroup
libcgroup-tools
libcollection
libcom_err
libcroco
libcurl
libdaemon
libdb
libdb-utils
libdrm
libedit
liberasurecode
libestr
libevent
libexif
libffi
libfontenc
libgcc
libgcrypt
libgfortran
libglade2
libgnome-keyring
libgnomecanvas
libgomp
libgovirt
libgpg-error
libgsf
libgudev1
libguestfs
libgusb
libgxps
libibverbs
libicu
libidn
libimagequant
libimobiledevice
libini_config
libiptcdata
libiscsi
libjpeg-turbo
libmediaart
libmnl
libmodman
libmount
libndp
libnetfilter_conntrack
libnetfilter_cthelper
libnetfilter_cttimeout
libnetfilter_queue
libnfnetlink
libnfsidmap
libnl
libnl3
libnl3-cli
libogg
libosinfo
libpath_utils
libpcap
libpciaccess
libpipeline
libplist
libpng
libproxy
libpwquality
libquadmath
librados2
librbd1
librdmacm
libref_array
libreport-filesystem
libseccomp
libsecret
libselinux
libselinux-python
libselinux-ruby
libselinux-utils
libsemanage
libsemanage-python
libsepol
libsndfile
libsoup
libss
libssh2
libstdc++
libstemmer
libsysfs
libtalloc
libtasn1
libteam
libtevent
libthai
libtheora
libtiff
libtirpc
libtool-ltdl
libunistring
libunwind
libusal
libusbx
libuser
libutempter
libuuid
libverto
libverto-tevent
libvirt
libvirt-client
libvirt-daemon
libvirt-daemon-config-network
libvirt-daemon-config-nwfilter
libvirt-daemon-driver-interface
libvirt-daemon-driver-lxc
libvirt-daemon-driver-network
libvirt-daemon-driver-nodedev
libvirt-daemon-driver-nwfilter
libvirt-daemon-driver-qemu
libvirt-daemon-driver-secret
libvirt-daemon-driver-storage
libvirt-daemon-kvm
libvirt-gconfig
libvirt-glib
libvirt-gobject
libvirt-python
libvisual
libvorbis
libwebp
libxcb
libxkbfile
libxml2
libxml2-python
libxshmfence
libxslt
libxslt-python
libyaml
libzip
linux-firmware
lksctp-tools
lm_sensors-libs
logrotate
lsof
lsscsi
lua
lvm2
lvm2-libs
lzo
lzop
m2crypto
mailcap
mailx
make
man-db
mariadb-common
mariadb-config
mariadb-errmsg
mariadb-libs
mdadm
mdi-common
mesa-dri-drivers
mesa-filesystem
mesa-libEGL
mesa-libGL
mesa-libGLU
mesa-libgbm
mesa-libglapi
mesa-private-llvm
microcode_ctl
mlocate
mongodb-server
mozjs17
mtools
nagios-common
ncurses
ncurses-base
ncurses-libs
net-snmp
net-snmp-agent-libs
net-snmp-libs
net-tools
netcf-libs
nettle
newt
newt-python
nfs-utils
nmap-ncat
novnc
nrpe
nspr
nss
nss-softokn
nss-softokn-freebl
nss-sysinit
nss-tools
nss-util
numactl-libs
numad
openjpeg-libs
openjpeg2
openldap
openssh
openssh-clients
openssh-server
openssl
openssl-libs
openstack-ceilometer-common
openstack-ceilometer-compute
openstack-ceilometer-polling
openstack-neutron
openstack-neutron-common
openstack-neutron-openvswitch
openstack-nova-common
openstack-nova-compute
openstack-packstack
openstack-packstack-puppet
openstack-puppet-modules
openstack-selinux
openstack-utils
openvswitch
orc
os-prober
p11-kit
p11-kit-trust
pam
pango
parted
passwd
pciutils
pciutils-libs
pcre
perl
perl-Carp
perl-Compress-Raw-Bzip2
perl-Compress-Raw-Zlib
perl-Data-Dumper
perl-Encode
perl-Error
perl-Exporter
perl-File-Path
perl-File-Temp
perl-Filter
perl-Getopt-Long
perl-Git
perl-HTTP-Tiny
perl-IO-Compress
perl-Net-Daemon
perl-PathTools
perl-PlRPC
perl-Pod-Escapes
perl-Pod-Perldoc
perl-Pod-Simple
perl-Pod-Usage
perl-Scalar-List-Utils
perl-Socket
perl-Storable
perl-TermReadKey
perl-Text-ParseWords
perl-Time-HiRes
perl-Time-Local
perl-constant
perl-hivex
perl-libs
perl-macros
perl-parent
perl-podlators
perl-threads
perl-threads-shared
php-cli
php-common
pinentry
pixman
pkgconfig
plymouth
plymouth-core-libs
plymouth-scripts
policycoreutils
policycoreutils-python
polkit
polkit-pkla-compat
poppler
poppler-data
poppler-glib
popt
ppp
procps-ng
psmisc
pth
pulseaudio-libs
pulseaudio-libs-glib2
puppet
pyOpenSSL
pycairo
pygobject2
pygobject3
pygobject3-base
pygpgme
pygtk2
pygtk2-libglade
pykickstart
pyliblzma
pyparsing
pysendfile
python
python-IPy
python-XStatic-Angular
python-XStatic-Angular-Bootstrap
python-XStatic-Angular-Gettext
python-XStatic-Angular-Mock
python-XStatic-Angular-lrdragndrop
python-XStatic-Bootstrap-Datepicker
python-XStatic-Bootstrap-SCSS
python-XStatic-D3
python-XStatic-Hogan
python-XStatic-JQuery-Migrate
python-XStatic-JQuery-TableSorter
python-XStatic-JQuery-quicksearch
python-XStatic-JSEncrypt
python-XStatic-Jasmine
python-XStatic-Magic-Search
python-XStatic-QUnit
python-XStatic-Rickshaw
python-XStatic-Spin
python-XStatic-jQuery
python-XStatic-jquery-ui
python-XStatic-smart-table
python-XStatic-termjs
python-alembic
python-amqp
python-amqplib
python-anyjson
python-automaton
python-backports
python-backports-ssl_match_hostname
python-beaker
python-beautifulsoup4
python-boto
python-bson
python-cachetools
python-ceilometer
python-chardet
python-cheetah
python-cinderclient
python-cliff
python-cliff-tablib
python-cmd2
python-configobj
python-configshell
python-contextlib2
python-croniter
python-crypto
python-dateutil
python-decorator
python-django
python-django-appconf
python-django-bash-completion
python-django-compressor
python-django-horizon
python-django-pyscss
python-dns
python-docutils
python-dogpile-cache
python-dogpile-core
python-ecdsa
python-editor
python-enum34
python-ethtool
python-extras
python-firewall
python-fixtures
python-futures
python-glanceclient
python-html5lib
python-httplib2
python-idna
python-iniparse
python-ipaddr
python-ipaddress
python-jinja2
python-jsonpath-rw
python-jsonschema
python-keyring
python-keystoneclient
python-keystonemiddleware
python-kitchen
python-kmod
python-kombu
python-ldap
python-ldappool
python-lesscpy
python-libguestfs
python-libs
python-linecache2
python-lockfile
python-logutils
python-lxml
python-mako
python-markdown
python-markupsafe
python-memcached
python-migrate
python-mimeparse
python-monotonic
python-msgpack
python-ncclient
python-netaddr
python-netifaces
python-networkx-core
python-neutron
python-neutronclient
python-nose
python-nova
python-novaclient
python-oauthlib
python-openstackclient
python-openvswitch
python-oslo-concurrency
python-oslo-db
python-oslo-log
python-oslo-messaging
python-oslo-middleware
python-oslo-policy
python-oslo-rootwrap
python-oslo-service
python-oslo-versionedobjects
python-oslo-vmware
python-osprofiler
python-paramiko
python-paste
python-paste-deploy
python-pathlib
python-pbr
python-perf
python-pint
python-ply
python-posix_ipc
python-prettytable
python-pycadf
python-pycparser
python-pycurl
python-pyeclib
python-pygments
python-pymongo
python-pyudev
python-qpid
python-qpid-common
python-repoze-lru
python-repoze-who
python-retrying
python-rhsm
python-rhsm-certificates
python-routes
python-rtslib
python-ryu
python-saslwrapper
python-semantic_version
python-simplegeneric
python-simplejson
python-six
python-slip
python-slip-dbus
python-sqlalchemy
python-sqlparse
python-stevedore
python-swiftclient
python-tablib
python-taskflow
python-tempita
python-testtools
python-tooz
python-traceback2
python-unicodecsv
python-unittest2
python-urlgrabber
python-urwid
python-versiontools
python-waitress
python-warlock
python-webob
python-websockify
python-webtest
python-werkzeug
python-wrapt
python-zope-interface
python2-PyMySQL
python2-XStatic
python2-appdirs
python2-babel
python2-castellan
python2-cffi
python2-cryptography
python2-debtcollector
python2-eventlet
python2-fasteners
python2-funcsigs
python2-futurist
python2-greenlet
python2-iso8601
python2-jsonpatch
python2-jsonpath-rw-ext
python2-jsonpointer
python2-mock
python2-numpy
python2-olefile
python2-os-brick
python2-os-client-config
python2-oslo-config
python2-oslo-context
python2-oslo-i18n
python2-oslo-reports
python2-oslo-serialization
python2-oslo-utils
python2-passlib
python2-pecan
python2-pillow
python2-psutil
python2-pyasn1
python2-pysaml2
python2-pysnmp
python2-pysocks
python2-requests
python2-rfc3986
python2-rsa
python2-scipy
python2-scss
python2-setuptools
python2-singledispatch
python2-suds
python2-urllib3
python2-wsme
pytz
pyxattr
qemu-img
qemu-kvm
qemu-kvm-common
qrencode-libs
quota
quota-nls
rabbitmq-server
radvd
rarian
rarian-compat
rdma
readline
redis
rest
roboto-fontface-common
rootfiles
rpcbind
rpm
rpm-build-libs
rpm-libs
rpm-python
rsync
rsyslog
ruby
ruby-augeas
ruby-irb
ruby-libs
ruby-shadow
rubygem-bigdecimal
rubygem-io-console
rubygem-json
rubygem-psych
rubygem-rdoc
rubygems
saslwrapper
scrub
seabios-bin
seavgabios-bin
sed
selinux-policy
selinux-policy-targeted
setools-libs
setup
sgabios-bin
shadow-utils
shared-mime-info
slang
snappy
sos
spice-glib
spice-gtk3
spice-protocol
spice-server
sqlite
startup-notification
sudo
supermin5
sysfsutils
syslinux
syslinux-extlinux
system-config-date
system-config-date-docs
system-config-keyboard
system-config-keyboard-base
system-config-kickstart
system-config-language
systemd
systemd-libs
systemd-python
systemd-sysv
sysvinit-tools
taglib
tar
targetcli
tcl
tcp_wrappers
tcp_wrappers-libs
tcpdump
teamd
telegraf
telnet
tigervnc
tigervnc-icons
tigervnc-license
tigervnc-server
tigervnc-server-minimal
tk
totem-pl-parser
tracker
trousers
tuned
tzdata
unbound-libs
unixODBC
upower
usbmuxd
usbredir
usermode
usermode-gtk
ustr
util-linux
v8
vim-common
vim-enhanced
vim-filesystem
vim-minimal
virt-install
virt-manager
virt-manager-common
virt-top
virt-viewer
virt-what
virt-who
vte-profile
vte291
web-assets-filesystem
webkitgtk3
wget
which
wpa_supplicant
xcb-util
xfsprogs
xinetd
xkeyboard-config
xml-common
xorg-x11-server-utils
xorg-x11-xauth
xorg-x11-xinit
xorg-x11-xkb-utils
xz
xz-libs
yajl
yaml-cpp
yelp
yelp-libs
yelp-xsl
yum
yum-metadata-parser
yum-plugin-fastestmirror
yum-utils
zlib

%end
