require 'qmail_log/analyze/helper'

module QmailLog
  class Analyzer
    class << self
      include QmailLog::Analyze::Helper

      def analyze log, data, qid_from_did, memory
        time     = Tai64.parse(log.split[0]).to_time.to_s
        content  = log.partition(' ')[-1]
        queue_id = queue_id(content, qid_from_did)

        case content
        when /(new)/
          memory[queue_id] = { time: {} }

        when /(info)/
          memory[queue_id].merge!( info(content) )

        when /(starting)/
          memory[queue_id].merge!( starting(content) )
          qid_from_did[ memory[queue_id][:delivery_id] ] = queue_id

        when /(delivery)/
          memory[queue_id].merge!( delivery(content) )

        when /end/
          memory[queue_id][:time][:end] = time
          data << memory[queue_id].merge!({ queue_id: queue_id })
        end

        memory[queue_id][:time][$1.to_sym] = time if $1
      end
    end
  end
end
