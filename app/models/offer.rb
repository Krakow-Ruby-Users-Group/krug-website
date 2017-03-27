class Offer < ApplicationRecord
  belongs_to :sponsor

  paginates_per 8
end
