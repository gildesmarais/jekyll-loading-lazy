# jekyll-loading-lazy

This plugin adds `loading="lazy"` to all `img` and `iframe` tags on
your [Jekyll site](https://jekyllrb.com/). No configuration needed.  
If a `loading` attribute is already present nothing is changed.

`loading="lazy"` causes images and iframes to load lazily without any JavaScript.
[Browser support](https://caniuse.com/#feat=loading-lazy-attr) is growing.  
If a browser does not support the `loading` attribute, it will load the resource
just like it would normally.

If you like this plugin, be awesome and
[_buy me a coffee_ ☕️](https://www.buymeacoffee.com/gildesmarais). Thank you!

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

That's basically all there is.
In case you want to eager load some images/iframes, add `loading="eager"`
to their tags.

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
