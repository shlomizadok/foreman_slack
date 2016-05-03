require File.expand_path('../lib/foreman_slack/version', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name        = 'foreman_slack'
  s.version     = ForemanSlack::VERSION
  s.date        = Date.today.to_s
  s.authors     = ['Shlomi Zadok']
  s.email       = ['shlomi@ben-hanna.com']
  s.homepage    = 'https://github.com/shlomizadok/foreman_slack'
  s.summary     = 'Sends events from Foreman to Slack.'
  # also update locale/gemspec.rb
  s.description = 'Sends events (like host built) from Foreman to Slack.'

  s.files = Dir['{app,config,db,lib,locale}/**/*'] + ['LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'slack-notifier'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rdoc'
end
