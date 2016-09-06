# A single point of entry for all the customizations and extensions needed for
# an activerecord model
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
