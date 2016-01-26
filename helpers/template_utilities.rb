module TemplateUtilities
  def phone_to(num)
    link_to num, "tel:#{num}"
  end

  def is_current_page_active(page)
    return current_page.data.has_key?('key') && current_page.data['key'] === page
  end

  def image_link(img)
    "#{root_url}/images#{img}"
  end

  def absolute_link(endpoint)
    "#{root_url}#{endpoint}"
  end

  def root_url
    ENV['ROOT_URL']
  end

  def environment?(env)
    return ENV['CUSTOM_MIDDLEMAN_ENV'] == env.to_s
  end
end