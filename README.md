# middleman-avenir
A SEO-optimized project template for [Middleman](http://middlemanapp.com).

## Features
__SEO Features__
- Comprehensive meta tags for search engines and social media platforms,
- Easily manage site-wide information in `data/site.yml`,
- Customizable page-level title, description, and image via [YAML frontmatter](https://middlemanapp.com/basics/frontmatter/),
- Sitemaps generated in both `HTML` and `XML`,
- Customizable `robots.txt` generation via [middleman-robots](http://github.com/yterajima/middleman-robots),
  - Example: `preferred_url: http://medium.com/article-name` will produce `<link href="http://medium.com/article-name" rel="canonical">`
- Google Analytics tag template
- Absolute URL generation means you can easily deploy the site to a subdirectory of a domain instead of the root (i.e. `exmaple.com/mysite` as opposed to `example.com`).
- various template helpers for link generation, image generation, and inline markdown formatting.

### Frontmatter Features

- `preferred_url` (`rel="canonical"`) for any page
- `title`
- `description`
- `seo_image`
    + relative link to an image to use as the image for embeds
    + example: `/banner.png`
- `twitter_card_type`
    + Twitter card type
- `twitter_handle`
    + Twitter handle for the site the content is hosted on
- `twitter_creator`
    + Creator of the content
- `tags` (generates meta tags)
    + Expects a yaml array of strings

## Usage & Getting Started

1. `gem install middleman -v 3.4.1`
    - Hope and pray that you don't need to build `nokogiri`.
2. Create your new static site instance
    - `git clone git@github.com:AvenirHQ/middleman-avenir.git ~/.middleman/avenir`
    - `middleman init my-project --template=avenir`
    - Don't forget to twiddle your thumbs as `bundle install` runs its course.
    - `cd my-project`
3. Create all of the `.env` files.
    - They should closely mimick the example `.env.{env}.default` files provided.
    - These files let you configure deployment to S3, as well as environment-specific values (notably `ROOT_URL`, necessary for hosting a website that isn't at the root of a domain).
4. `bower install`
5. Start developing!

### Build & Deploy

##### Dev

To develop the website, run

```
rake dev
```

Which will start a livereload server and present the website.

##### Staging / Production

When you want to deploy the website to staging or production, build the site with

```
rake build[staging]
# or
rake build[production]
```

To deploy to S3, run

```
rake deploy[staging]
# or
rake deploy[production]
```

This will use the `awscli` along with the `AWS_S3_PROFILE`, `AWS_S3_REGION`, and `AWS_S3_BUCKET` ENV values to upload the website to S3. Please configure there beforehand with the correct permissions.

You can also create your own environments (for testing or anything else). Simply add a `.env.myenv` file and build/deploy with `rake build[myenv]`


__Other Features__
- bower integration _"just works"_

## Dependencies

- [Middleman](http://middlemanapp.com)
- [Slim](http://slim-lang.com/) templates
- [Sass](http://sass-lang.com/) with [Bourbon](http://bourbon.io/)
- [awscli](http://docs.aws.amazon.com/cli/latest/userguide/installing.html) for deploying to S3

## Notes

### Middleman 3 vs 4

We're using `middleman-3.4.1` for this project until our external dependencies (notably `middleman-imagemin` and others) update to the `middleman-4` extension API.

To mimic the [`environments`](https://middlemanapp.com/basics/upgrade-v4/) feature in `middleman-4`, we implemented the `CUSTOM_MIDDLEMAN_ENV` environment variable that determins which `.env.{env}` file to load into the environment. This lets us do environment-specific things at the deploy level in `Rakefile` and at the application level in `config.rb` and within templates.

The upgrade path looks something like:

- strip out the `CUSTOM_MIDDLEMAN_ENV` code and use the `-e {environment}` flag for determining environment
    + includes updating the `Rakefile`
    + the `.env` files should be replaces with the `environments/{env}.rb` equivalents
- update deps to `middleman-4` compatible versions
- remove the `environment?` template helper (is a builtin in `middleman-4`)
- dance joyously after mitigating technical debt

## LICENSE

The MIT License (MIT)

Copyright (c) 2015 Avenir Interactive

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
