class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications

  scope :first_five, -> { limit(5).order('id asc')}
  scope :dinghy, -> { where("length < '20'")}
  scope :ship, -> { where("length > '20'" )}
  scope :last_three_alphabetically, -> { limit(3).order('name desc')}
  scope :without_a_captain, -> { where(captain_id: nil)}
  scope :sailboats, -> { joins(:classifications).where(classifications: { name: "Sailboat"})}
  scope :catamarans, -> { joins(:classifications).where(classifications: { name: "Catamaran"})}
  scope :motorboats, -> { joins(:classifications).where(classifications: {name: "Motorboat"})}
  scope :longest, -> { order("length DESC").first }
  
  def self.with_three_classifications
    @num_of_classification = Boat.joins(:classifications).group(:boat_id).size
    @num_of_classification.map do |boat|
      if boat[1] == 3
        Boat.find(boat[0])
      end
    end.compact
  end

  ##FLATIRON SOLUTION

  # def self.with_three_classifications
  #   joins(:classifications).group("boats.id").having("COUNT(*) = 3").select("boats.*")
  # end

  # def self.non_sailboats
  #   where("id NOT IN (?)", self.sailboats.pluck(:id))
  # end


end
