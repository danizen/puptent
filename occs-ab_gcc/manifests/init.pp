# == Class: ab_gcc
#
# Installs the "Development Tools" group from yum repos.
# The packages were determined by running 
#     yum groupinfo "Development Tools"
# on CentOS 6.
#
# === Parameters
#
# None
#
# === Examples
#
#  class { ab_gcc: }
#
# === Authors
#
# Dan Davis <daniel.davis@nih.gov>
#
class ab_gcc {
  package {['autoconf',
            'automake',
            'binutils',
            'bison',
            'flex',
            'gcc',
            'gcc-c++',
            'gettext',
            'libtool',
            'make',
            'patch',
            'pkgconfig',
            'redhat-rpm-config',
            'rpm-build',
            'byacc',
            'cscope',
            'ctags',
            'diffstat',
            'doxygen',
            'elfutils',
            'gcc-gfortran',
            'git',
            'indent',
            'intltool',
            'patchutils',
            'rcs',
            'subversion',
            'swig',
            'systemtap']:
    ensure => present
  }
}
