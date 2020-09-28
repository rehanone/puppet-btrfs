
# btrfs Puppet Module

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with btrfs](#setup)
    * [What btrfs affects](#what-btrfs-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with btrfs](#beginning-with-btrfs)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This modules can create, mount and configure btrfs filesystems and subvolumes.

## Setup

### Setup Requirements

The module depends on the following puppet modules:

* puppetlabs/stdlib

## Usage

Create a btrfs RAID1 filesystem:
```puppet
::btrfs::pool { 'storage':
  type  => 'raid1',
  disks => [ '/dev/sdX', '/dev/sdY' ],
}
```

## Hiera config

```yaml
btrfs::package_ensure: present #default is latest
btrfs::pools:
  storage:
    type: raid1
    disks:
      - /dev/sdX
      - /dev/sdY
```

## Development

For contributions please open an Issue on [github](https://github.com/rehanone/puppet-btrfs/issues) and create a corrensponding [pull request](https://github.com/rehanone/puppet-btrfs/pulls)
