class Guest < ActiveRecord::Base

  has_many :visits

  validates :name, presence: true, length: { maximum: 250, minimum: 2 }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 250 }, format: { with: VALID_EMAIL_REGEX }
  validates :bill_to, presence: true, length: { maximum: 250, minimum: 2 }
  validates :address, presence: true
  validates :city, presence: true
  validates :zip, presence: true, numericality: { only_integer: true }, length: { is: 5}

end
