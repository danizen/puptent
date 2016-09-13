require 'facter'

# NOTE: grep may need to be adjusted to STB/SSS assigned channel name
Facter.add(:ab_python_have_repo) do
  confine :osfamily => 'RedHat'
  setcode '/usr/bin/yum list rh-python34 2>/dev/null | /bin/grep "^rh-python34" | /usr/bin/wc -l'
end
