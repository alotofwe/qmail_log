module QmailLog
  module Format
    class JSON
      class << self
        def parse data
          ::JSON.dump(data)
        end
      end
    end
  end
end
