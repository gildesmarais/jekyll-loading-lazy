# frozen_string_literal: true

RSpec.describe(Jekyll::LoadingLazy) do
  Jekyll.logger.log_level = :error

  let(:configs) do
    Jekyll.configuration(
      'skip_config_files' => false,
      'source' => unit_fixtures_dir,
      'destination' => unit_fixtures_dir('_site')
    )
  end

  let(:site) { Jekyll::Site.new(configs) }
  let(:posts) { site.posts.docs.sort.reverse }

  let(:post_with_multiple_markdown_images) do
    find_by_title(posts, 'Post with multiple markdown images')
  end

  let(:post_with_img) { find_by_title(posts, 'Post with html <img> tag') }
  let(:post_with_loading_img) do
    find_by_title(posts, 'Post with html <img> tag having loading attribute')
  end

  let(:post_with_iframe) { find_by_title(posts, 'Post with html <iframe> tag') }
  let(:post_with_loading_iframe) do
    find_by_title(posts, 'Post with html <iframe> tag having loading attribute')
  end

  let(:document_with_liquid_tag) do
    find_by_title(site.collections['docs'].docs, 'Document with liquid tag')
  end
  let(:document_with_include) do
    find_by_title(site.collections['docs'].docs, 'Document with include')
  end

  before(:each) do
    site.reset
    site.read
    (site.pages | posts | site.docs_to_write).each { |p| p.content.strip! }
    site.render
  end

  it 'should not break layout content' do
    expect(site.pages.first.output).to include(
      '<div>Layout content started.</div>'
    )

    expect(site.pages.first.output).to include(
      '<div>Layout content ended.</div>'
    )
  end

  context 'with loading attribute absent' do
    it do
      expect(post_with_multiple_markdown_images.output).to include(<<~HTML)
        <ol>
          <li><img src="https://via.placeholder.com/150" alt="alt" loading="lazy"></li>
          <li><img src="https://via.placeholder.com/250" alt="alt" loading="lazy"></li>
          <li><img src="https://via.placeholder.com/350" alt="alt" loading="lazy"></li>
        </ol>
        HTML
    end

    it do
      expect(post_with_img.output).to include(<<~HTML)
        <p><img src="https://via.placeholder.com/150" loading="lazy"></p>
        HTML
    end

    it do
      expect(post_with_iframe.output).to include(<<~HTML)
        <iframe src="https://via.placeholder.com/150" loading="lazy"></iframe>
        HTML
    end

    it 'adds loading attribute on image with liquid tags' do
      expect(document_with_liquid_tag.output).to include(<<~HTML)
      <p>This <img src="/docs/document-with-liquid-tag.html" loading="lazy"> is an image with a liquid tag.</p>
      HTML
    end

    it 'adds loading attribute on image within includes' do
      expect(document_with_include.output).to include(<<~HTML)
      <p>This is a document with an include: This is an include. It has an image. <img src="https://via.placeholder.com/150" alt="" loading="lazy"></p>
      HTML
    end
  end

  context 'with loading attribute present' do
    it 'does not change the attributes value' do
      expect(post_with_loading_img.output).to include(<<~HTML)
        <p><img src="https://via.placeholder.com/150" loading="eager"></p>
      HTML
    end

    it 'does not change the attributes value' do
      expect(post_with_loading_iframe.output).to include(<<~HTML)
        <iframe src="https://example.com" loading="eager"></iframe>
      HTML
    end
  end
end
