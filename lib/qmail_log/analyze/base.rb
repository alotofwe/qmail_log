module QmailLog
  module Analyze
    class Base
      attr_reader :results, :memory

      def initialize
        @results      = []
        @qid_from_did = {}
        @memory       = {}
      end
    end
  end
end
