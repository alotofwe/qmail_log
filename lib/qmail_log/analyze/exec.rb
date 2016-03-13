module QmailLog
  module Analyze
    class Exec < Base
      def run logs
        logs.each_line do |log|
          QmailLog::Analyze::Analyzer.analyze(log, @results, @qid_from_did, @memory)
        end
      end
    end
  end
end
