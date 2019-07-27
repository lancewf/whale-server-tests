title 'server tests'

control 'server' do
  impact 1.0
  title 'server is verified'
  desc 'test that the server is working'

  describe filesystem('/') do
    its('free_kb') { should be > 5000000 } #5GB free
  end
end
