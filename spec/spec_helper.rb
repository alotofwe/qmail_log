$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'qmail_log'
require 'helpers'

set :backend, :exec

RSpec.configure do |c|
  c.include Helpers
end
