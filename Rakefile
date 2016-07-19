require 'rubygems'
require 'bundler/setup'

require 'rubocop/rake_task'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'

# These gems aren't always present, for instance
# on Travis with --without development

begin
  require 'puppet_blacksmith/rake_tasks'
rescue LoadError # rubocop:disable Lint/HandleExceptions
end

RuboCop::RakeTask.new

task test: [
  :rubocop,
  :metadata_lint,
  :lint,
  :spec
]
