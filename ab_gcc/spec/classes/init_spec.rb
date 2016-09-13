require 'spec_helper'
describe 'ab_gcc' do

  context 'with defaults for all parameters' do
    it { should contain_class('ab_gcc') }
  end
end
