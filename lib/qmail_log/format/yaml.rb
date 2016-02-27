module QmailLog
  module Format
    class YAML
      class << self
        def parse data
          data.to_yaml
        end
      end
    end
  end
end
