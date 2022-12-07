# @summary
#  This is the main btrfs configuration class, definded types can be passed as hash via hiera.
#
# @param package_manage
#   Control whether the btrfs packages should be managed by puppet or not
# @param package_ensure
#   set the state or version of btrfs packages which should be installed
# @param package_name
#   See `data/` for defaults and OS specific values
# @pools
#   Hash of btrfs raid pools which should be created
# @subvolumes
#   Hash of btrfs subvolumes which should be created inside pools
#
class btrfs (
  Boolean $package_manage,
  String  $package_ensure,
  String  $package_name,
  Hash    $pools,
  Hash    $subvolumes,
) {
  if ($package_ensure in ['absent', 'purged']) {
    class { "${module_name}::install": }
  } else {
    anchor { "${module_name}::begin": }
    -> class { "${module_name}::install": }
    -> class { "${module_name}::config": }
    -> anchor { "${module_name}::end": }
  }
}
