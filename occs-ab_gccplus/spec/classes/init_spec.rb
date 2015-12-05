require 'spec_helper'
describe 'ab_gccplus' do

  context 'with defaults for all parameters' do
    it { should contain_class('ab_gccplus') }
  end
end
