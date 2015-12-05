require 'facter'

Facter.add(:ab_ruby_devel) do
    setcode do
        `hostname -s`.start_with?('d') ? true : nil
    end
end

