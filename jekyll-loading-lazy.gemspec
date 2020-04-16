# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-loading-lazy/version'

Gem::Specification.new do |spec|
  spec.name = 'jekyll-loading-lazy'
  spec.version = Jekyll::LoadingLazy::VERSION
  spec.authors = ['Gil Desmarais']
  spec.email = ['jekyll-loading-lazy@desmarais.de']
  spec.summary = 'Automatically adds loading="lazy" to <img> and <iframe> tags.'
  spec.description = 'Loading Lazy automatically adds loading="lazy" to <img> and <iframe> tags on your Jekyll site.'
  spec.homepage = 'https://github.com/gildesmarais/jekyll-loading-lazy'
  spec.license = 'MIT'
  spec.files = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.5.8'
  spec.add_dependency 'jekyll', '>= 3.0', '<5.0'
  spec.add_dependency 'nokogiri', '>= 1.10', '< 2.0'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency "rubocop-jekyll"
end
