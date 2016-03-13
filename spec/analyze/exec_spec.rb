describe QmailLog::Analyze::Exec do
  let(:log) { File.open('./spec/helper/files/log/one.log', &:read) }

  it 'should analyze given strings' do
    expect( QmailLog.analyze(:exec, log) ).to eq(analyzed_log)
  end
end
