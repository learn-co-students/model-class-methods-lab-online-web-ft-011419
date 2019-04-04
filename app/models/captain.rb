class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    joins(boats: :classifications).where(classifications: {name: 'Catamaran'})
  end

  def self.sailors
    joins(boats: :classifications).where(classifications: {name: 'Sailboat'}).distinct!
  end

  def self.talented_seafarers
    where('id IN (?)', sailors.pluck(:id) & motorboat_captains.pluck(:id))
  end

  def self.motorboat_captains
    includes(boats: :classifications).where(classifications: {name: 'Motorboat'})
  end

  def self.non_sailors
    where.not(id: sailors.pluck(:id))
  end
end
