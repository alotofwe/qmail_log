describe QmailLog::Analyze::Helper do
  let(:including_class) { Class.new { include QmailLog::Analyze::Helper }.new }
  let(:queue_id)        { '93869' }
  let(:delivery_id)     { '2392' }
  let(:qid_from_did)    { { delivery_id => queue_id } }
  let(:keys)            { %w(new info starting delivery end) }

  describe '.queue_id' do
    let(:keys)            { %w(new info starting delivery end) }

    it 'should return correct queue_id' do
      keys.each do |key|
        content = send("#{key}_log").partition(' ')[-1]
        expect( including_class.queue_id(content, qid_from_did) ).to eq(queue_id)
      end
    end
  end

  describe '.info' do
    let(:content) { info_log.partition(' ')[-1] }
    let(:bytes)   { '2343' }
    let(:from)    { 'dave@sill.org' }
    let(:qp)      { '18695' }
    let(:uid)     { '49491' }

    it 'should return correct bytes' do
      expect( including_class.info(content)[:bytes] ).to eq(bytes)
    end

    it 'should return correct from' do
      expect( including_class.info(content)[:from] ).to eq(from)
    end

    it 'should return correct qp' do
      expect( including_class.info(content)[:qp] ).to eq(qp)
    end

    it 'should return correct qp' do
      expect( including_class.info(content)[:uid] ).to eq(uid)
    end
  end

  describe '.starting' do
    let(:content) { starting_log.partition(' ')[-1] }
    let(:region)  { 'remote' }
    let(:to)      { 'lwq@w3.to' }

    it 'should return correct delivery_id' do
      expect( including_class.starting(content)[:delivery_id] ).to eq(delivery_id)
    end

    it 'should return correct region' do
      expect( including_class.starting(content)[:region] ).to eq(region)
    end

    it 'should return correct to' do
      expect( including_class.starting(content)[:to] ).to eq(to)
    end
  end

  describe '.delivery' do
    let(:content) { delivery_log.partition(' ')[-1] }
    let(:status)  { 'success: 209.85.127.177_accepted_message. /Remote_host_said:_250_CAA01516_Message_accepted_for_delivery/' }

    it 'should return correct delivery_id' do
      expect( including_class.delivery(content)[:delivery_id] ).to eq(delivery_id)
    end

    it 'should return correct status' do
      expect( including_class.delivery(content)[:status] ).to eq(status)
    end
  end
end
