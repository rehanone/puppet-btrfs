class btrfs (
  Boolean $package_manage,
  String  $package_ensure,
  String  $package_name,
  Hash    $pools      = {},
  Hash    $subvolumes = {},
) {

  if ($package_ensure in [ 'absent', 'purged' ]) {
    class { "${module_name}::install": }
  } else {
    anchor { "${module_name}::begin": }
    -> class { "${module_name}::install": }
    -> class { "${module_name}::config": }
    -> anchor { "${module_name}::end": }
  }
}
