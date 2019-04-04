class Boat < ActiveRecord::Base
  belongs_to :captain
  has_many :boat_classifications
  has_many :classifications, through: :boat_classifications

  def self.first_five
    first(5)
  end

  def self.dinghy
    where('length < 20')
  end

  def self.ship
    where('length > 20')
  end

  def self.last_three_alphabetically
    order('name DESC').first(3)
  end

  def self.without_a_captain
    where(captain_id: nil)
  end

  def self.sailboats
    joins(:classifications).where(classifications: {name: 'Sailboat'})
  end

  def self.with_three_classifications
    joins(:classifications).group(:boat_id).having('COUNT(*)=3')
  end

  # join all :classifications by group with a boat_id, and filter all that have a
  # total of 3
  def self.longest
    order(:length).last
  end
end
