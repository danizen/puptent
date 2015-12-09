require 'facter'

# NOTE: grep may need to be adjusted for STB/SSS assigned channel name
Facter.add(:ab_ruby_have_repo) do
  confine :osfamily => 'RedHat'
  setcode '/usr/bin/yum list rh-ruby22 2>/dev/null | /bin/grep -i "^rh-ruby22" | /usr/bin/wc -l'
end
