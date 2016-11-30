class User < ActiveRecord::Base
  has_secure_password

  has_many :reservations
  has_many :restaurants, through: :reservations

  has_many :owned_restaurants, class_name: "Restaurant", inverse_of: :owner, foreign_key: :owner_id

  validates :name, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :phone, numericality: {only_integer: true}

end
