# QmailLog

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'qmail_log'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install qmail_log

## Usage

### Analyze your qmail log

* localhost

```
QmailLog.analyze(PATH_TO_LOG) => array
```

* SSH

```
QmailLog.analyze(PATH_TO_LOG, SSH_HOST, {
  port:     SSH_PORT
  user:     SSH_USER
  password: SSH_PASSWORD
}) => array
```

`PATH_TO_LOG` should be valid path to file or directory.  
If analyzer receive directory path, it analyze all files in this directory.

Returned array has following format:

```
[{:time=>
   {:new=>"2000-03-06T17:45:10Z",
    :info=>"2000-03-06T17:45:10Z",
    :starting=>"2000-03-06T17:45:10Z",
    :delivery=>"2000-03-06T17:45:11Z",
    :end=>"2000-03-06T17:45:11Z"},
  :bytes=>"2343",
  :from=>"alotofwe@email.com",
  :qp=>"18695",
  :uid=>"49491",
  :delivery_id=>"2392",
  :region=>"remote",
  :to=>"suzupy@email.com",
  :status=>
   "success:209.85.127.177_accepted_message./Remote_host_said:_250_CAA01516_Message_accepted_for_delivery/",
  :queue_id=>"93869"},

  ... 
]

```

### Parse returned array

* JSON

```
QmailLog.parse(array, :json)
  => [{"time":{"new":"2000-03-06T17:45:10Z","info":"2000-03-06T17:45:10Z","starting":"2000-03-06T17:45:10Z","delivery":"2000-03-06T17:45:11Z","end":"2000-03-06T17:45:11Z"},"bytes":"2343","from":"dave@sill.org","qp":"18695","uid":"49491","delivery_id":"2392","region":"remote","to":"lwq@w3.to","status":"success:209.85.127.177_accepted_message./Remote_host_said:_250_CAA01516_Message_accepted_for_delivery/","queue_id":"93869"},

  ...
```

* YAML

```
QmailLog.parse(array, :yaml)
=> ---
   - :time:
       :new: '2000-03-06T17:45:10Z'
       :info: '2000-03-06T17:45:10Z'
       :starting: '2000-03-06T17:45:10Z'
       :delivery: '2000-03-06T17:45:11Z'
       :end: '2000-03-06T17:45:11Z'
     :bytes: '2343'
     :from: dave@sill.org
     :qp: '18695'
     :uid: '49491'
     :delivery_id: '2392'
     :region: remote
     :to: lwq@w3.to
     :status: success:209.85.127.177_accepted_message./Remote_host_said:_250_CAA01516_Message_accepted_for_delivery/
     :queue_id: '93869'

     ...
```

* LTSV

```
QmailLog.parse(array, :ltsv)
  => bytes:2343	from:dave@sill.org	qp:18695	uid:49491	delivery_id:2392	region:remote	to:lwq@w3.to	status:success:209.85.127.177_accepted_message./Remote_host_said:_250_CAA01516_Message_accepted_for_delivery/	queue_id:93869	new_time:2000-03-06T17:45:10Z	info_time:2000-03-06T17:45:10Z	starting_time:2000-03-06T17:45:10Z	delivery_time:2000-03-06T17:45:11Z	end_time:2000-03-06T17:45:11Z

  ...
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/qmail_log. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

