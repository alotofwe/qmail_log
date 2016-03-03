describe QmailLog do
  it 'has a version number' do
    expect( QmailLog::VERSION ).not_to be nil
  end

  describe '.analyze' do
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
