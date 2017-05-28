# Model representing single sponsor's job offer
class Offer < ApplicationRecord
  belongs_to :sponsor

  scope :sorted, -> { order(created_at: :desc) }

  def to_param
    "#{id}-#{sponsor.name}-#{title}".parameterize
  end
end
