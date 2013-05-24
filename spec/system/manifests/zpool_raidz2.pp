zpool { 'tank':
  ensure      => present,
  raidz       => [ 'd01 d02 d03 d04', 'd05 d06 d07 d08' ],
  raid_parity => 'raidz2',
  pool        => 'tank',
  log_mirror  => 'd09 d10',
  force       => true,
}
