define btrfs::pool (
  Enum[raid1] $type,
  Array[Stdlib::Absolutepath] $disks,
) {
  $pool = $name

  $pool_first_disk = $disks[0]
  $disks_str = join($disks, ' ')

  exec { $pool:
    command => "mkfs.btrfs -L ${pool} -d ${type} -m ${type} ${disks_str}; mkdir -p /${pool}; mount ${pool_first_disk} /${pool}",
    creates => "/${pool}",
    cwd     => '/var',
    path    => ['/sbin', '/bin', '/usr/bin', '/usr/sbin'],
    timeout => '0',
    require => Class["${module_name}::install"],
  }
}
