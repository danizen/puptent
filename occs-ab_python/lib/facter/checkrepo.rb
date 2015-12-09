require 'facter'

# NOTE: grep may need to be adjusted to STB/SSS assigned channel name
Facter.add(:ab_python_have_repo) do
  confine :osfamily => 'RedHat'
  setcode '/bin/yum -C repolist | /bin/grep -i "python 3\.4" | /bin/wc -l'
end
