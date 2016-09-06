# A single point of entry for all the customizations and extensions needed for
# an action controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper Bootsy::Engine.helpers
end
