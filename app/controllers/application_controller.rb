# A single point of entry for all the customizations and extensions needed for
# an action controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :newest_meeting
  helper Bootsy::Engine.helpers

  private

  # Returns the newest events which we need in global scope
  def newest_meeting
    @newest_meeting = Event.sorted.first
  end
end
