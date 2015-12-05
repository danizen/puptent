# == Class: ab_ruby
#
# Install Ruby 2.2 on CentOS/RedHat 6/7 by installing the 
# rh-ruby22 Software collection rpms.
#
# === Parameters
#
# No parameters
#
# === Facter checks
#
# $ab_ruby_devel - determines whether development packages are installed
#
# === Examples
#
#  class { ab_ruby: }
#
# === Authors
#
# Daniel Davis <daniel.davis@nih.gov>
#
class ab_ruby(
  $devel = $ab_ruby::params::devel
) extends ab_ruby::params {

  if $osfamily != 'RedHat' {
    warning('occs_ruby: this is not a RedHat box')
  } else {
    package { 'rh-ruby22':
      ensure => 'present'
    }
    if $devel {
      package { 'rh-ruby22-ruby-devel':
        ensure => 'present' 
      }
    }
  }
}

