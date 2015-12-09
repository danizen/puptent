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
class ab_python(
  $devel = $ab_python::params::devel
) inherits ab_python::params {
  if $osfamily != 'RedHat' {
    warning('ab_python: this is not a RedHat box')
  } elsif $ab_python_have_repo != 1 {
    warning('ab_python: software collection not available')
  } else {
    package { ['rh-python34', 'rh-python34-python-virtualenv']:
      ensure => 'present'
    }

    # These are packages needed by installed python modules
    package { [ 'mysql-libs', 
                'openssl', 
                'libxslt', 
                'gmp',
                'keyutils-libs',
                'libgcrypt',
                'libyaml',
                'libffi',
                'libxml2',
                'libgpg-error',
                'zlib',
                'nss-softokn-freetbl',
                'krb5-libs',
                'libcom_err' ]:
        ensure => 'present'
    }

    if $devel {
      package { 'rh-python34-python-devel':
        ensure => 'present' 
      }

      # needed to build/rebuild installed python modules
      package { [ 'mysql-devel',
                  'openssl-devel',
                  'gmp-devel',
                  'keyutils-libs-devel',
                  'libgcrypt-devel',
                  'libyaml-devel',
                  'libffi-devel',
                  'libxml2-devel',
                  'libgpg-error-devel',
                  'zlib-devel',
                  'krb5-devel',
                  'libcom_err-devel' ]:
        ensure => 'present'
      }
    }
  }
}

