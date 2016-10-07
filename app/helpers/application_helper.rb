# All application helpers
module ApplicationHelper
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  def newest_meeting_header(event)
    status = event.status == 'past' ? 'LAST' : 'NEXT'

    "#{status} MEETING"
  end
end
