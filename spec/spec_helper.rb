# frozen_string_literal: true

require "jekyll-loading-lazy"

RSpec.configure do |_config|
  UNIT_FIXTURES_DIR = File.expand_path("fixtures/unit", __dir__).freeze

  def unit_fixtures_dir(*paths)
    File.join(UNIT_FIXTURES_DIR, *paths)
  end

  def find_by_title(docs, title)
    docs.find { |d| d.data["title"] == title }
  end
end
