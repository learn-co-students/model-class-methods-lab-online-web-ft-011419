class Captain < ActiveRecord::Base
  has_many :boats

  scope :catamaran_operators, -> {}

end
