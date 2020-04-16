# Jekyll Loading Lazy

This plugin adds `loading="lazy"` attribute to all `img` and `iframe` tags
unless a `loading` attribute is already present.

This causes images and iframes to load lazily without any JavaScript.
[Browser support](https://caniuse.com/#feat=loading-lazy-attr) is growing.
If a browser does not support the `loading` attribute, it will directly
(read: _blockingly_) load the resource.

## Installation

Add the following to your site's `Gemfile`

```
gem 'jekyll-loading-lazy'
```

and add the following to your site's `_config.yml`

```yml
plugins:
  - jekyll-loading-lazy
```

Note: if `jekyll --version` is less than `3.5` use:

```yml
gems:
  - jekyll-loading-lazy
```

## Support

Simply [create an issue](https://github.com/gildesmarais/jekyll-loading-lazy/issues/new) and I will respond as soon as possible.

## Contributing

1. [Fork it](https://github.com/gildesmarais/jekyll-loading-lazy/fork)
2. Create your feature branch (`git checkout -b my-new-feature)
3. Commit your changes (`git commit -m 'Add some feature'`)
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

### Testing

```bash
rake spec
# or
rspec
```

## Credits

Thanks to [@keithmifsud's `jekyll-target-blank`](https://github.com/keithmifsud/jekyll-target-blank) whereon this plugin largely bases.
