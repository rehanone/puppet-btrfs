class btrfs::install () inherits btrfs {

  assert_private("Use of private class ${name} by ${caller_module_name}")

  if $btrfs::package_manage {
    package { $btrfs::package_name:
      ensure => installed,
    }
  }
}
