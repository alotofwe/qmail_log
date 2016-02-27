require "qmail_log/version"
require 'specinfra'
require 'specinfra/helper/set'
require 'tai64'
require 'json'
require 'yaml'
require 'ltsv'

require 'qmail_log/ssh'
require 'qmail_log/formatter'
require 'qmail_log/analyzer'

include Specinfra::Helper::Set

module QmailLog
  class << self
    def analyze path, host = 'localhost', ssh_options = {}
      QmailLog::SSH::Configure.backend(host, ssh_options)
      @runner = Specinfra::Runner

      raise Errno::ENOENT unless @runner.check_file_is_file(path)

      data, qid_from_did, memory = [], {}, {}

      @runner.get_file_content(path).stdout.split("\n").each do |log|
        QmailLog::Analyzer.analyze(log, data, qid_from_did, memory)
      end
      data
    end

    def parse data, format = :json
      QmailLog::Formatter.run(format, data)
    end
  end
end
