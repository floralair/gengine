name        'gmaster'
description 'Grid role for grid software deployment. It includes seting up IP/FQDN, mounting and formatting local disks.'

run_list *%w[
  gengine
  gengine::nfs
  gengine::master
]

