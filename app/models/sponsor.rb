# Model representing single KRUG sponsor
class Sponsor < ApplicationRecord
  mount_uploader :logo, LogoUploader
end
