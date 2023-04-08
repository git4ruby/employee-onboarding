class Role < ApplicationRecord
  ADMIN = "admin"
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  scope :admin, -> { find_by_name(ADMIN) }
  scope :order_by_name, -> { order(name: :asc) }

  validates :name, presence: true, uniqueness: { case_sensitive: false}
end
