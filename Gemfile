source 'https://rubygems.org'

group :test do
  gem 'rake'
  gem 'puppet', ENV['PUPPET_GEM_VERSION'] || '~> 4'
  gem 'puppetlabs_spec_helper'
  gem 'rspec-puppet-facts'
  gem 'metadata-json-lint'
  gem 'rspec'
  gem 'rubocop'

  gem 'puppet-lint-absolute_classname-check'
  gem 'puppet-lint-leading_zero-check'
  gem 'puppet-lint-trailing_comma-check'
  gem 'puppet-lint-version_comparison-check'
  gem 'puppet-lint-classes_and_types_beginning_with_digits-check'
  gem 'puppet-lint-unquoted_string-check'
end

group :development do
  gem 'travis'
  gem 'travis-lint'
  gem 'puppet-blacksmith'
  gem 'guard-rake'
  gem 'pry'
  gem 'yard'
end

group :acceptance do
  gem 'beaker'
  gem 'beaker-rspec'
  gem 'beaker-puppet_install_helper'
  gem 'beaker_spec_helper'
end
