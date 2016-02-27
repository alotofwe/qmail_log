module QmailLog
  module Analyze
    module Helper
      def queue_id content, qid_from_did
        case content
        when /new/      then content.split[2]
        when /info/     then content.split[2].gsub(':', '')
        when /starting/ then content.split[4]
        when /delivery/ then qid_from_did[ content.split[1].gsub(':', '') ]
        when /end/      then content.split[2]
        end
      end

      def info content
        _, _, _, _, bytes, _, from, _, qp, _, uid = content.split
        {
          bytes: bytes,
          from:  from.gsub(/<(.*)>/, '\1'),
          qp:    qp,
          uid:   uid
        }
      end

      def starting content
        _, _, delivery_id, _, _, _, region, to = content.split
        {
          delivery_id: delivery_id.gsub(':', ''),
          region:      region,
          to:          to
        }
      end

      def delivery content
        _, delivery_id, *status = content.split
        {
          delivery_id: delivery_id.gsub(':', ''),
          status:      status.join
        }
      end
    end
  end
end
