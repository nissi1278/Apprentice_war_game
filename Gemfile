source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.6"

gem 'typeprof'
gem 'sorbet-runtime'
gem 'steep'
gem 'activesupport'

group :development do
  gem 'solargraph'
end

group :development,:test do
  gem 'debug'
  gem 'minitest'
  gem 'rake'
  gem 'rubocop', '~> 1.75', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-minitest', require: false
end
