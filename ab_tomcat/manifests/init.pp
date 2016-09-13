# == Class: ab_tomcat
#
# Install Tomcat 8.0.28 by expanding it into /usr/nlm/apps
#
# === Parameters
#
#  $user ... The user who owns the package, e.g. platform
#  $home ... The home directory where it should be installed, e.g. /usr/nlm/apps
#
# === Facter checks
#
#  None
#
# === Examples
#
#  class { ab_tomcat: }
#
# === Authors
#
# Daniel Davis <daniel.davis@nih.gov>
#
class ab_tomcat(
  $user = 'platform',
  $group = 'platform',
  $home = '/usr/nlm/apps'
) {

  $tomcat_dir = 'apache-tomcat-8.0.28'
  $tomcat_file = "${tomcat_dir}.zip"
  $tomcat_source = "puppet:///modules/ab_tomcat/${tomcat_file}"

  file { $home:
    ensure      => 'directory',
    mode        => '0755',
    owner       => $user,
    group       => $group,
  }

  file { "${home}/${tomcat_file}":
    source      => $tomcat_source,
    mode        => '0644',
    notify      => Exec['apps-tomcat-unzip']
  }

  exec { 'apps-tomcat-unzip':
    command     => "/usr/bin/unzip ${home}/${tomcat_file} -d ${home}; /bin/mv ${home}/${tomcat_dir} ${home}/tomcat",
    cwd         => $home,
    umask       => '0022',
    require     => File["${home}/${tomcat_file}"],
    refreshonly => true,
  }
}




