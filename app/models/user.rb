class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_PHONE_REGEX = /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}\z/

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  attr_accessor :role_ids


  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Invalid Email"}, uniqueness: true
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX, message: "Invalid Phone"}, uniqueness: true

  before_validation { 
    (self.email = self.email.to_s.downcase)
  }

  # Make sure first name and last name are present and unique.
  validates_presence_of     :first_name
  validates_presence_of     :last_name

  def is_admin?
    roles.exists?(name: Role::ADMIN)
  end


end
