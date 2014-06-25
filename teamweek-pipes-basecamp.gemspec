# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'teamweek/pipes/basecamp/version'

Gem::Specification.new do |spec|
  spec.name          = 'teamweek-pipes-basecamp'
  spec.version       = Teamweek::Pipes::Basecamp::VERSION
  spec.authors       = ['Toggl OÜ']
  spec.email         = ['support@teamweek.com']
  spec.summary       = %q{Teamweek Pipes integrations with Basecamp.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = ['lib/teamweek-pipes-basecamp.rb']
  spec.files        += Dir.glob('lib/teamweek/pipes/basecamp/*.rb')
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'basecamp-ruby'
  spec.add_runtime_dependency 'teamweek-pipes'

  spec.add_development_dependency 'bundler', "~> 1.6"
  spec.add_development_dependency 'rake'
end
