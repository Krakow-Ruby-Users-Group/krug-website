# All application helpers
module ApplicationHelper
  # Sets active class if it is needed
  def active_class(link_path)
    current_page?(link_path) ? 'active' : ''
  end

  # Prepare newest event header
  def newest_meeting_header(event)
    status = event.status == 'past' ? 'LAST' : 'NEXT'
    "#{status} MEETING"
  end
end
