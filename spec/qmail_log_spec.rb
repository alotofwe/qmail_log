describe QmailLog do
  it 'has a version number' do
    expect( QmailLog::VERSION ).not_to be nil
  end

  describe '.analyze' do
    before {
      FileUtils.touch('./spec/helper/files/log/one.log',         mtime: Time.now - 300)
      FileUtils.touch('./spec/helper/files/log/two.log',         mtime: Time.now - 200)
      FileUtils.touch('./spec/helper/files/log/three/three.log', mtime: Time.now - 100)
    }

    describe 'when given path is file' do
      let(:path) { './spec/helper/files/log/one.log' }

      it 'should analyze given file' do
        expect( QmailLog.analyze(path).length ).to eq(2)
      end
    end

    describe 'when given path is directory' do
      let(:path) { './spec/helper/files/log' }

      it 'should analyze all files in given directory' do
        expect( QmailLog.analyze(path).length ).to eq(4)
      end
    end
  end
end
