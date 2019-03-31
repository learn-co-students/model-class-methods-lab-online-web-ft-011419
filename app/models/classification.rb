class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  scope :my_all, -> {Classification.all}
  
  def self.longest
    @boat = Boat.longest
    @boat.classifications
  end

end
