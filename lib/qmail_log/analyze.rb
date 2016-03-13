require 'qmail_log/analyze/helper'
require 'qmail_log/analyze/base'
require 'qmail_log/analyze/exec'
require 'qmail_log/analyze/ssh'
require 'qmail_log/analyze/analyzer'

module QmailLog
  module Analyze
    def self.run mode, args
      case mode.to_sym
      when :exec then klassname = 'Exec'
      when :ssh  then klassname = 'SSH'
      end
      const_get(klassname).new.tap{ |o| o.run(*args) }.results
    end
  end
end
