class Offer < ApplicationRecord
  belongs_to :sponsor

  paginates_per 8

  scope :sorted, -> { order(created_at: :desc) }

  def to_param
    "#{id}-#{sponsor.name}-#{title}".parameterize
  end
end
