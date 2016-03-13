describe QmailLog::Analyze do
  let(:log) { File.open('./spec/helper/files/log/one.log', &:read) }
  let(:unfinished) do
    {"12345"=>{:time=>{:new=>"2000-03-06T17:45:10Z", :info=>"2000-03-06T17:45:10Z"}, :bytes=>"2343", :from=>"dave@sill.org", :qp=>"18695", :uid=>"49491"}}
  end

  it 'should return unfinished log' do
    expect( QmailLog.analyze(:exec, log)[:unfinished] ).to eq(unfinished)
  end
end
