define btrfs::subvolume (
  String $pool,
  String $mode,
  String $owner,
  String $group,
) {
  $subvolume = $name

  exec { $subvolume:
    command   => "btrfs subvolume create ${subvolume}",
    creates   => "/${pool}/${subvolume}",
    cwd       => "/${pool}",
    path      => ['/sbin', '/bin', '/usr/bin', '/usr/sbin'],
    timeout   => '0',
    logoutput => true,
    loglevel  => 'debug',
    require   => Btrfs::Pool[$pool],
  }

  file { $subvolume:
    ensure  => directory,
    path    => "/${pool}/${subvolume}",
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    require => Exec[$subvolume],
  }
}
