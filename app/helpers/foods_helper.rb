module FoodsHelper

  def markdown(text)
    extensions = { hard_wrap: true, autolink: true, no_intra_emphasis: true, strikethrough: true, quote: true, disable_indented_code_blocks: true }
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions).render(text).html_safe
  end

end
