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
  
  def self.with_three_classifications
    
  end


end
