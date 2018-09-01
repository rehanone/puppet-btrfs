class btrfs::config () inherits btrfs {

  assert_private("Use of private class ${name} by ${caller_module_name}")

  create_resources('btrfs::pool', $btrfs::pools)
  create_resources('btrfs::subvolume', $btrfs::subvolumes)
}
