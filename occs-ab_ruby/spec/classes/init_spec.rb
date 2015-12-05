require 'spec_helper'
describe 'ab_ruby' do

  context 'with defaults for all parameters' do
    it { should contain_class('ab_ruby') }
  end
end
