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

      raise Errno::ENOENT unless @runner.check_file_is_file(path) or @runner.check_file_is_directory(path)

      data, qid_from_did, memory = [], {}, {}

      files(path).each do |file|
        @runner.get_file_content(file).stdout.split("\n").each do |log|
          QmailLog::Analyzer.analyze(log, data, qid_from_did, memory)
        end
      end
      data
    end

    def parse data, format = :json
      QmailLog::Formatter.run(format, data)
    end

    def files path
      @runner.run_command("find #{path} -type f -exec ls -rt '{}' +").stdout.split("\n")
    end
  end
end
