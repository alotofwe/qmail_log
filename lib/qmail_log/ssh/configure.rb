module QmailLog
  module SSH
    class Configure
      class << self
        def backend host, ssh_options
          ssh_options.symbolize_keys!

          case host
          when 'localhost', '127.0.0.1'
            set :backend, :exec
          else
            set :backend,       :ssh
            set :host,          host
            set :ssh_options,   ssh_options
            set :sudo_password, ssh_options[:password]
          end
        end
      end
    end
  end
end

class Hash
  def symbolize_keys!
    self.replace(
      self.inject({}) do |res, (key, value)|
        res[key.to_sym] = value
        res
      end
    )
  end
end
