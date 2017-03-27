# Model representing single KRUG sponsor
class Sponsor < ApplicationRecord
  mount_uploader :logo, LogoUploader

  has_many :offers

  scope :sorted, -> { order(created_at: :desc) }
end
