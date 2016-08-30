module System
  # Settings object from Settingslogic
  class Settings < Settingslogic
    source "#{Rails.root}/config/settings.yml"
    namespace Rails.env
  end
end
