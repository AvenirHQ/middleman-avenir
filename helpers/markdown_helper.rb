module MarkdownHelper
  def inline_markdown(text)
    # Redcarpet definitely exists because I specified it in config.rb and it's in the Gemfile
    rc = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    rc.render(text).html_safe
  end
end