# Modify the parameters to match your defaults
class { 'ab_tomcat':
  user => 'davisda4',
  group => 'occs',
  home => '/home/davisda4/puptest'
}
