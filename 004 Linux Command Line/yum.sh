''' ------------------------------- YUM -----------------------------  '''
# find files
fin / -name "ibpcre"

# search package
sudo yum search pcre

# install package just from one repo
sudo yum --disablerepo=\* --enablerepo=cdp install gt236