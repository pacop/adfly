# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "adfly"
  gem.email = "pacopa.93@gmail.com"
  gem.homepage = "http://github.com/pacop/adfly"
  gem.license = "MIT"
  gem.summary = %Q{Unofficial API Wrapper for adf.ly}
  gem.description = %Q{Unofficial API Wrapper for adf.ly}
  gem.email = "pacopa.93@gmail.com"
  gem.authors = ["pacop"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :test => :spec

require 'yard'
YARD::Rake::YardocTask.new


task :default => [:spec]