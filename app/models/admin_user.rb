# The model representing single admin user
class AdminUser < ApplicationRecord
  devise :database_authenticatable,
    :recoverable,
    :rememberable,
    :trackable,
    :validatable
end
