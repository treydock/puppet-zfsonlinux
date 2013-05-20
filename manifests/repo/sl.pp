# == Class: zfsonlinux::repo::sl
#
# Enables the sl-addons repo in order to pull in zfsonlinux.
#
# === Authors
#
# Trey Dockendorf <treydock@gmail.com>
#
# === Copyright
#
# Copyright 2013 Trey Dockendorf
#
class zfsonlinux::repo::sl {

  if ! defined(Yumrepo['sl-addons']) {
    yumrepo { 'sl-addons':
      enabled => '1',
    }
  } else {
    Yumrepo <| title == 'sl-addons' |> { enabled => '1' }
  }

}
