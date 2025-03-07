# README

   This is my personal Gentoo overlay for packages not added in portage tree and ebuilds I have not been able to find anywhere else. All ebuilds have been commited by 'repoman -dx commit'..

# HOWTO

* Create wuseman-overlay.conf into /etc/portage/repos.conf/

```sh
cat << "EOF" > /etc/portage/repos.conf/wuseman-overlay.conf
[wuseman-overlay]
# Simple example 'overlaid' ebuild repository
location = /var/db/repos/wuseman-overlay
priority = 0
auto-sync = no
#masters-gentoo
EOF
```

* And run below commands for clone and sync wuseman-overlay
    
```sh
mkdir -p /etc/portage/repos.conf/{wuseman-overlay,metadata}
echo -e "masters = gentoo" > /etc/portage/repos.conf/metadata/layout.conf
echo -e 'LOCAL_PORTDIR="/etc/portage/repos.conf/"' >> /etc/portage/make.conf
git clone https://github.com/wuseman/wuseman-overlay /var/db/repos/wuseman-overlay
which eix &> /dev/null; [[ $? -eq 0 ]] && eix-sync; eix-update || emerge --sync
```

# References

    https://github.com/gentoo/gentoo
    https://github.com/pentoo/pentoo-overlay
    

# CONTACT

     If you have problems, questions, ideas or suggestions please contact
     us by posting to wuseman@nr1.nu

# WEB SITE

     Visit our homepage for the latest info and updated tools

     https://nr1.nu & https://github.com/wuseman/

### END!

