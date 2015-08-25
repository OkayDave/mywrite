module ArticlesHelper
  def render_markdown(input)
    opts = {
      space_after_headers: true,
      link_attributes: { target: "_blank" },
      hard_wrap: true,
      filter_html: true,
      fenced_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(opts)
    md = Redcarpet::Markdown.new(renderer)

    return md.render(input).html_safe
  end
end
