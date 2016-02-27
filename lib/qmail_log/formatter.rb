require 'qmail_log/format/json'
require 'qmail_log/format/yaml'
require 'qmail_log/format/ltsv'

module QmailLog
  class Formatter
    class << self
      def run format, data
        const_get("QmailLog::Format::#{format.upcase}").parse(data)
      end
    end
  end
end
