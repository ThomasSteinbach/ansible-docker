describe service('docker') do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end

describe port(4243) do
 it { should be_listening }
 its('protocols') { should cmp 'tcp6' }
end

# check 'remote' access on localhost
describe command('docker --tlsverify --tlscacert="$HOME/.ansible-data/thomass.docker/pki/ca.pem" --tlscert="$HOME/.ansible-data/thomass.docker/pki/client-cert.pem" --tlskey="$HOME/.ansible-data/thomass.docker/pki/client-key.pem" -H=tcp://localhost:4243 version') do
  its('stderr') { should eq '' }
end

