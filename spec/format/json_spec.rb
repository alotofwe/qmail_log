describe QmailLog::Format::JSON do
  describe '.parse' do
    it "shouldn't raise any errors when receive String" do
      expect { QmailLog::Format::JSON.parse('string') }.not_to raise_error
    end

    it "shouldn't raise any errors when receive nil" do
      expect { QmailLog::Format::JSON.parse(nil) }.not_to raise_error
    end
  end
end
