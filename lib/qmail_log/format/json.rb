module QmailLog
  module Format
    class JSON
      class << self
        def parse data
          data.to_json
        end
      end
    end
  end
end
