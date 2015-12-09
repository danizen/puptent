require 'facter'

# NOTE: grep may need to be adjusted to STB/SSS assigned channel name
Facter.add(:ab_python_have_repo) do
  confine :osfamily => 'RedHat'
  setcode '/usr/bin/yum repolist 2>/dev/null | /bin/grep -i -E "python 3\.?4" | /usr/bin/wc -l'
end
