# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-loading-lazy/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll-loading-lazy"
  spec.version = Jekyll::LoadingLazy::VERSION
  spec.authors = ["Gil Desmarais"]
  spec.email = %w(jekyll-loading-lazy@desmarais.de)
  spec.summary = 'Automatically adds loading="lazy" to <img> and <iframe> tags.'
  spec.description = <<~DESC
    Loading Lazy automatically adds loading="lazy" to <img> and <iframe> tags on your Jekyll site.
  DESC
  spec.homepage = "https://github.com/gildesmarais/jekyll-loading-lazy"
  spec.license = "MIT"
  spec.files = Dir["{lib}/**/*.*", "*.md"]
  spec.metadata = {
    "bug_tracker_uri" =>
                         "https://github.com/gildesmarais/jekyll-loading-lazy/issues",
  }
  spec.require_paths = %w(lib)
  spec.required_ruby_version = ">= 2.5.8"
  spec.add_dependency "jekyll", ">= 3.0", "<5.0"
  spec.add_dependency "nokogiri", ">= 1.10", "< 2.0"
  spec.add_development_dependency "bundler", '~> 2.0'
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", '<= 1.0'
  spec.add_development_dependency "rubocop-jekyll", '<= 1.0'
end
