class CustomRenderHTML < Redcarpet::Render::HTML

end

module MarkdownHelper
  def plaintext(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::StripDown)
    markdown.render(text)
  end

  def markdown(text)
    options = {
      with_toc_data: true,
      hard_wrap: true
    }
    extensions = {
      no_intra_emphasis: true,
      tables: true,
      autolink: true,
      lax_spacing: true,
      
      lax_html_blocks: true,
      footnotes: true,
      space_after_headers: true,
      strikethrough: true,
      underline: true,
      highlight: true,
      quote: true
    }

    renderer = CustomRenderHTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render(text).html_safe
  end

  def toc(text)
    renderer = Redcarpet::Render::HTML_TOC.new(nesting_level: 6)
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end
end