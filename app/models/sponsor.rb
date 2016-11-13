# Model representing single KRUG sponsor
class Sponsor < ApplicationRecord
  mount_uploader :logo, LogoUploader

  scope :sorted, -> { order(created_at: :desc) }
end
