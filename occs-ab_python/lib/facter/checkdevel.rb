require 'facter'

Facter.add(:ab_python_devel) do
    setcode do
        `hostname -s`.start_with?('d') ? true : nil
    end
end

