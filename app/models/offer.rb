# Model representing single sponsor's job offer
class Offer < ApplicationRecord
  belongs_to :sponsor

  scope :sorted, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :description, presence: true

  def to_param
    [id, sponsor&.name, title]
      .compact
      .join('-')
      .parameterize
  end
end
