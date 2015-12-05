require 'spec_helper'
describe 'ab_python' do

  context 'with defaults for all parameters' do
    it { should contain_class('ab_python') }
  end
end
