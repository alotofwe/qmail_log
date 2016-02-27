module QmailLog
  module Format
    class LTSV
      class << self
        def parse data
          ltsv = ''
          data.each do |d|
            d[:time].each { |key, value| d["#{key}_time".to_sym] = value }
            d.delete(:time)
            ltsv << "#{LTSV.dump(d)}\n"
          end
          ltsv
        end
      end
    end
  end
end
