require 'facter'

# NOTE: grep may need to be adjusted for STB/SSS assigned channel name
Facter.add(:ab_ruby_have_repo) do
  confine :osfamily => 'RedHat'
  setcode '/bin/yum -C repolist | /bin/grep -i "ruby 2\.2" | /bin/wc -l'
end
