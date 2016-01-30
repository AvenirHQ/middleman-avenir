module SeoTemplateHelpers
  def page_title
    current_page.data.title || data.site.title
  end

  def page_description
    current_page.data.description || data.site.description
  end

  def current_page_url
    "#{root_url}#{current_page.url}"
  end

  def page_url page
    "#{root_url}#{page.url}"
  end

  # SEO Helpers
  def page_twitter_card_type
    current_page.data.twitter_card_type || 'summary_large_image'
  end

  def page_twitter_handle
    current_page.data.twitter_handle || data.site.twitter_handle
  end

  def page_twitter_creator
    current_page.data.twitter_creator || data.site.twitter_handle
  end

  def seo_image
    image_link(current_page.data.seo_image || data.site.seo_image)
  end

  # Social share URLs
  def facebook_url
    data.site.facebook_url
  end

  def youtube_url
    data.site.youtube_url
  end
end
