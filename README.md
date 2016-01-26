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
- `title`,
- `description`
- `seo_image`
- `twitter_card_type`
- `twitter_handle`
- `tags` (generates meta tags)
    + Expects a yaml array of strings

## Usage

To get started, first create all of the `.env` files for your environments. They should look similar to the example `.env.{env}.default` files at the root of the project. These files let you configure deployment to S3, as well as environment-specific values (notably `ROOT_URL`, useful for hosting a website taht isn't at the root of a website).

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

## Usage
Clone this repo into your `~/.middleman` directory as "avenir"

`git clone git@github.com:avenirhq/middleman-avenir.git ~/.middleman/avenir`

Now you can simply init new projects with the "avenir" template:

`middleman init my-project --template=avenir `
