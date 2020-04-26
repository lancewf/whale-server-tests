title 'pacific-northwest.whaledisentanglement.org tests'

control 'pacific-northwest-whaledisentanglement-org' do
  impact 1.0
  title 'Pacific Northwest Whale Disentanglement site is verified'
  desc 'test that the pacific-northwest.whaledisentanglement.org is working'

  httpsResponse = inspec.http("https://pacific-northwest.whaledisentanglement.org", max_redirects: 1, read_timeout: 90)
  httpsBody = httpsResponse.body.force_encoding(Encoding::UTF_8)

  describe "testing https response" do
    it { expect(httpsBody).to match('<h2 class="site-description">Pacific Northwest</h2>') }
    it { expect(httpsBody).not_to match('cdn.eeduelements.com')}
    it { expect(httpsResponse.status).to eq(200) }
  end
  describe inspec.http("http://pacific-northwest.whaledisentanglement.org", max_redirects: 2, read_timeout: 90) do
    its('status') { should eq(200) }
    its('body') { should match('<h2 class="site-description">Pacific Northwest</h2>') } 
  end
end
