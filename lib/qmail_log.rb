require "qmail_log/version"
require 'specinfra'
require 'specinfra/helper/set'
require 'tai64'
require 'json'
require 'yaml'
require 'ltsv'

require 'qmail_log/ssh'
require 'qmail_log/formatter'
require 'qmail_log/analyze'

include Specinfra::Helper::Set

module QmailLog
  class << self
    def analyze mode, *args
      QmailLog::Analyze.run(mode, args)
    end

    def parse data, format = :json
      QmailLog::Formatter.run(format, data)
    end
  end
end
