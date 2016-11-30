class Reservation < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :users

  validates :party_size, :time, :date, presence: true
  validates :party_size, numericality: {only_integer: true}
  validate  :available?

  def available?
    unless party_size > 0 && available_capacity(time) >= party_size
      errors.add(:party_size, 'exceeds capacity at this date and time. Please select an alternative and try again.')
    end
  end

  private

  def available_capacity(time)
    restaurant.capacity - reservations_at(time).sum(:party_size)
  end

  def reservations_at(time)
    Reservation.where(time: time.beginning_of_hour..time.end_of_hour)
  end

end
