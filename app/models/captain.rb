class Captain < ActiveRecord::Base
  has_many :boats

  scope :catamaran_operators, -> { joins(:boats).merge(Boat.catamarans)}
  scope :sailors, -> { joins(:boats).merge(Boat.sailboats).distinct }
  scope :talented_seafarers, -> { joins(:boats).merge(Boat.sailboats) & joins(:boats).merge(Boat.motorboats)}
  

  def self.non_sailors
    @cap_sailor = Captain.sailors
    @cap = Captain.all

    (@cap_sailor - @cap) | (@cap - @cap_sailor)

  end

  ##FLATIRON CODE

  # def self.motorboat_operators
  #   includes(boats: :classifications).where(classifications: {name: "Motorboat"})
  # end

  # def self.talented_seafarers
  #   where("id IN (?)", self.sailors.pluck(:id) & self.motorboat_operators.pluck(:id))
  # end

  # def self.non_sailors
  #   where.not("id IN (?)", self.sailors.pluck(:id))
  # end



end
