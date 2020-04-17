# frozen_string_literal: true

require "jekyll"
require "nokogiri"

module Jekyll
  class LoadingLazy
    def self.process(content)
      content.output = process_image_tags(content.output)
    end

    def self.process?(doc)
      (doc.is_a?(Jekyll::Page) || doc.write?) && doc.output_ext == ".html" ||
        doc.permalink&.end_with?("/")
    end

    def self.process_image_tags(html)
      content = Nokogiri::HTML::DocumentFragment.parse(html)
      anchors = content.css("img[src], iframe[src]")
      anchors.each { |item| item["loading"] = "lazy" unless item["loading"] }
      content.to_html
    end

    private_class_method :process_image_tags
  end
end

Jekyll::Hooks.register [:pages, :documents], :post_render do |doc|
  Jekyll::LoadingLazy.process(doc) if Jekyll::LoadingLazy.process?(doc)
end
