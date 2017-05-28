# All application helpers
module ApplicationHelper
  # Sets active class if it is needed
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def markdown(text)
    Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      autolink: true,
      tables: true,
      underline: true,
      highlight: true
    ).render(text).html_safe
  end
end
