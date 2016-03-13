describe QmailLog::Analyze::SSH do
  let(:host) { 'localhost' }
  before {
    FileUtils.touch('./spec/helper/files/log/one.log',         mtime: Time.now - 300)
    FileUtils.touch('./spec/helper/files/log/two.log',         mtime: Time.now - 200)
    FileUtils.touch('./spec/helper/files/log/three/three.log', mtime: Time.now - 100)
    allow(QmailLog::SSH::Configure).to receive(:backend)
  }

  describe 'when given path is file' do
    let(:path) { './spec/helper/files/log/one.log' }

    it 'should analyze given file' do
      expect( QmailLog.analyze(:ssh, path, host).length ).to eq(2)
    end
  end

  describe 'when given path is directory' do
    let(:path) { './spec/helper/files/log' }

    it 'should analyze all files in given directory' do
      expect( QmailLog.analyze(:ssh, path, host).length ).to eq(4)
    end
  end
end
