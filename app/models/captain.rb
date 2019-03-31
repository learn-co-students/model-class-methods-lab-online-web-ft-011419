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



end
