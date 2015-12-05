require 'spec_helper'
describe 'ab_httpd' do

  context 'with defaults for all parameters' do
    it { should contain_class('ab_httpd') }
  end
end
