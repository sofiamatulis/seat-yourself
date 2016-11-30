class Restaurant < ActiveRecord::Base
  has_many :users, through: :reservations
  has_many :reservations, dependent: :destroy

  belongs_to :owner, class_name: "User", inverse_of: :owned_restaurants

  validates :name, :address, :phone, :capacity, :opening_hours, :closing_hours, presence: true
  validates :capacity, numericality: {only_integer: true}

  def self.find_by_first_letter(letter)
    @show = where('name LIKE ?', "#{letter}%").order('name ASC')
 end

 # def self.search(search)
 #   if search
 #     find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
 #  #  else
 #  #    find(:all)
 #   end
 # end


def self.search(search)
  where("name LIKE ?", "%#{search}%")
  where("name LIKE ?", "%#{search}%")
end

  # def available?(party_size, time)
  #   party_size > 0 && available_capacity(time) >= party_size
  # end
  #
  # private
  #
  # def available_capacity(time)
  #   :capacity - reservations_at(time).sum(:party_size)
  # end
  #
  # def reservations_at(time)
  #   reservations.where(time: time.beginning_of_hour..time.end_of_hour)
  # end

end
