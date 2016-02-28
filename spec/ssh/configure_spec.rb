describe QmailLog::SSH::Configure do
  describe '.backend' do
    describe 'host is localhost or 127.0.0.1' do
      it 'should set background to exec when host is localhost' do
        QmailLog::SSH::Configure.backend('localhost', {})
        expect( Specinfra.configuration.backend ).to eq(:exec)
      end

      it 'should set background to exec when host is 127.0.0.1' do
        QmailLog::SSH::Configure.backend('127.0.0.1', {})
        expect( Specinfra.configuration.backend ).to eq(:exec)
      end
    end

    describe 'host is other than localhost or 127.0.0.1' do
      let!(:ssh_options) do
        {
          port:     22,
          user:     'alotofwe',
          password: 'Always Look on the Bright Side of Life'
        }
      end

      it 'should set background to ssh' do
        QmailLog::SSH::Configure.backend('8.8.8.8', ssh_options)
        expect( Specinfra.configuration.backend ).to eq(:ssh)
      end

      it 'should set host' do
        QmailLog::SSH::Configure.backend('8.8.8.8', ssh_options)
        expect( Specinfra.configuration.host ).to eq('8.8.8.8')
      end

      it 'should set ssh_options' do
        QmailLog::SSH::Configure.backend('8.8.8.8', ssh_options)
        expect( Specinfra.configuration.ssh_options ).to eq(ssh_options)
      end
    end
  end
end
