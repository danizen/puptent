# == Class: ab_python
#
# Install Python 3.4 on CentOS/RedHat 6/7 by installing the -
# rh-python34 software collection rpms.
#
# === Parameters
#
# No parameters
#
# === Facter checks
#
# $ab_python_devel - determines whether development packages are installed
#
# === Examples
#
#  class { ab_python: }
#
# === Authors
#
# Daniel Davis <daniel.davis@nih.gov>
#
class ab_python {

  if $osfamily != 'RedHat' {
    warning('occs_python: this is not a RedHat box')
  } else {
    package { 'rh-python34':
      ensure => 'present'
    }
    if $ab_python_devel {
      package { 'rh-python34-python-devel':
        ensure => 'present' 
      }
    }
  }
}

