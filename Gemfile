source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.6"

gem 'typeprof'
gem 'sorbet-runtime'
gem 'activesupport'

group :development do
  gem 'solargraph'
end

group :development,:test do
  gem 'debug'
  gem 'minitest'
  gem 'rubocop', '~> 1.75', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-minitest', require: false
  gem 'guard'
  gem 'guard-minitest'
end
