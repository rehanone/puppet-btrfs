require 'spec_helper_acceptance'

describe 'btrfs class:', unless: UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  it 'btrfs is expected run successfully' do
    pp = "class { 'btrfs': }"

    # Apply twice to ensure no errors the second time.
    apply_manifest(pp, catch_failures: true) do |r|
      expect(r.stderr).not_to match(%r{error}i)
    end
    apply_manifest(pp, catch_failures: true) do |r|
      expect(r.stderr).not_to eq(%r{error}i)

      expect(r.exit_code).to be_zero
    end
  end

  context 'package_ensure => present:' do
    it 'runs successfully to ensure package is installed' do
      pp = "class { 'btrfs': package_ensure => present }"

      apply_manifest(pp, catch_failures: true) do |r|
        expect(r.stderr).not_to match(%r{error}i)
      end
    end
  end

  #  context 'creates pool and subvolume:' do
  #    it 'runs successfully' do
  #      shell('lsblk')
  #      shell('dd if=/dev/zero of=/tmp/loopback.img bs=10M count=1')
  #      shell('du -sh /tmp/loopback.img')
  #      shell('losetup -P /dev/loop1024 /tmp/loopback.img')
  #      shell('losetup -a')
  #
  #      pp = "class { 'btrfs':
  #        pools => { 'tank' => { type => raid1, disks => ['/dev/loop1024'], },
  #        subvolumes => { 'knife' => { pool => 'tank', mode => '0777', owner => 'root', group => 'root', },
  #      }"
  #
  #      apply_manifest(pp, catch_failures: true) do |r|
  #        expect(r.stderr).not_to match(%r{error}i)
  #      end
  #
  #      shell('test -e /tank/knife')
  #    end
  #  end

  context 'package_ensure => absent:' do
    it 'runs successfully to ensure package is uninstalled' do
      pp = "class { 'btrfs': package_ensure => absent, }"

      apply_manifest(pp, catch_failures: true) do |r|
        expect(r.stderr).not_to match(%r{error}i)
      end
    end
  end
end
