require 'spec_helper'

describe service('docker') do
  it { should be_running }
  it { should be_enabled }
end

# check installation of docker and the alias as well
describe command('docker version') do
  its(:stderr) { should eq '' }
end
