describe QmailLog::SSH::Configure do
  describe '.backend' do
    let(:host) { 'localhost' }
    let(:ssh_options) do
      {
        port:     22,
        user:     'alotofwe',
        password: 'Always Look on the Bright Side of Life'
      }
    end

    it 'should set background to ssh' do
      QmailLog::SSH::Configure.backend(host, ssh_options)
      expect( Specinfra.configuration.backend ).to eq(:ssh)
    end

    it 'should set host' do
      QmailLog::SSH::Configure.backend(host, ssh_options)
      expect( Specinfra.configuration.host ).to eq(host)
    end

    it 'should set ssh_options' do
      QmailLog::SSH::Configure.backend(host, ssh_options)
      expect( Specinfra.configuration.ssh_options ).to eq(ssh_options)
    end
  end
end
