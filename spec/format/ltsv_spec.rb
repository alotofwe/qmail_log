describe QmailLog::Format::LTSV do
  let(:data) { analyzed_log }

  describe '.parse' do
    it "should return variable that have (.*)_time column" do
      expect( QmailLog::Format::LTSV.parse(data).split("\n")[0] ).to match(/\tnew_time:/)
      expect( QmailLog::Format::LTSV.parse(data).split("\n")[0] ).to match(/\tend_time:/)
      expect( QmailLog::Format::LTSV.parse(data).split("\n")[0] ).to match(/\tinfo_time:/)
      expect( QmailLog::Format::LTSV.parse(data).split("\n")[0] ).to match(/\tstarting_time:/)
      expect( QmailLog::Format::LTSV.parse(data).split("\n")[0] ).to match(/\tdelivery_time:/)
    end

    it "shouldn't return variable that have time column" do
      expect( QmailLog::Format::LTSV.parse(data).split("\n")[0] ).not_to match(/\ttime:/)
    end

    it "shouldn't destruct received data" do
      expect{ QmailLog::Format::LTSV.parse(data) }.not_to change{ data }
    end
  end
end
