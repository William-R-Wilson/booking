class Visit < ActiveRecord::Base
  belongs_to :guest
  has_many :days
  validates :num_attendees, presence: true, numericality: {less_than: 101 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  accepts_nested_attributes_for :days

  def num_days
    number_days = (end_date - start_date).to_i + 1
  end

end
