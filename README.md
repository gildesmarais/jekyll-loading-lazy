# jekyll-loading-lazy [![](http://img.shields.io/liberapay/goal/gildesmarais.svg?logo=liberapa)](https://liberapay.com/gildesmarais/donate)

This plugin adds `loading="lazy"` to all `img` and `iframe` tags on
your [Jekyll site](https://jekyllrb.com/). No configuration needed.  
If a `loading` attribute is already present nothing is changed.

`loading="lazy"` causes images and iframes to load lazily without any JavaScript.
[Browser support](https://caniuse.com/#feat=loading-lazy-attr) is growing.  
If a browser does not support the `loading` attribute, it will load the resource
just like it would normally.

⭐ If you like it, star it or [sponsor it](https://liberapay.com/gildesmarais/donate). 💓

## Installation

1. Add the following to your site's `Gemfile`:

   ```ruby
   gem 'jekyll-loading-lazy'
   ```

2. add the following to your site's `_config.yml`:

   ```yml
   plugins:
     - jekyll-loading-lazy
   ```

   **Note**: if `jekyll --version` is less than `3.5` use:

   ```yml
   gems:
     - jekyll-loading-lazy
   ```

3. In your terminal, execute:

   ```bash
   bundle
   ```

4. (re)start your Jekyll server with:

   ```bash
   jekyll serve
   ```

## Usage

Install the plugin as described above. That's basically all there is.

**💡 Tip:** Note that the `github-pages` gem runs in `safe` mode and only allows [a defined set of plugins](https://pages.github.com/versions/). To use this gem in GitHub Pages, you need to build your site locally or use a CI (e.g. [Github Workflow](https://help.github.com/en/actions/configuring-and-managing-workflows/configuring-a-workflow)) and deploy to your `gh-pages` branch. [Click here for more information.](https://jekyllrb.com/docs/continuous-integration/github-actions/)

### Prevent lazy loading

In case you want to prevent loading some images/iframes lazily, add `loading="eager"` to their tags. This might be useful to prevent flickering of images during navigation (e.g. the site's logo).

See the following examples to prevent lazy loading.

<details>
  <summary>Markdown example</summary>

```markdown
![an example](/image.jpg){:loading='eager'}
```

This example assumes you're using Kramdown (Jekyll is using it by default).

</details>

<details>
  <summary>HTML example</summary>

```html
<img src="/image.jpg" alt="an example" loading="eager" />
```

</details>

## Contributing

1. [Fork this repository](https://github.com/gildesmarais/jekyll-loading-lazy/fork)
2. Create your branch (`git checkout -b feat/my-new-feature`)
3. Commit your changes (`git commit -m 'Add cool feature'`)
4. Push to the branch (git push origin feat/my-new-feature)
5. Create a new Pull Request

### Testing

```bash
rake
```

## Credits

Thanks to @keithmifsud's
[`jekyll-target-blank`](https://github.com/keithmifsud/jekyll-target-blank)
whereon this Jekyll plugin largely bases.
