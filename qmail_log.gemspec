# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'qmail_log/version'

Gem::Specification.new do |spec|
  spec.name          = "qmail_log"
  spec.version       = QmailLog::VERSION
  spec.authors       = ["alotofwe"]
  spec.email         = ["u.humika@gmail.com"]

  spec.summary       = %q{Analyze qmail log for save to hash, and parse it to DDL statements}
  spec.description   = %q{Analyze qmail log for save to hash, and parse it to DDL statements}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler',   '~> 1.11'
  spec.add_development_dependency 'rake',      '~> 10.0'
  spec.add_development_dependency 'rspec',     '~> 3.0'
  spec.add_development_dependency 'specinfra', '~> 2.51'
  spec.add_development_dependency 'tai64',     '~> 0.0'
  spec.add_development_dependency 'json',      '~> 1.8'
  spec.add_development_dependency 'ltsv',      '~> 0.1'
end
