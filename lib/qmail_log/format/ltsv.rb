module QmailLog
  module Format
    class LTSV
      class << self
        def parse data
          ltsv = ''
          data.each do |d|
            time = d[:time].inject({}) { |res, (key, value)| res["#{key}_time".to_sym] = value; res }
            ltsv << "#{::LTSV.dump(
              d.select { |key, value| key.to_sym != :time }.merge(time)
            )}\n"
          end
          ltsv
        end
      end
    end
  end
end
