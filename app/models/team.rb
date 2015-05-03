class Team < ActiveRecord::Base
  include SearchCop
  validates_presence_of :name
  validates :gamesPlayed, numericality: { only_integer: true }, :numericality => { :greater_than_or_equal_to => 0 }
  validates :wins, numericality: { only_integer: true }, :numericality => { :greater_than_or_equal_to => 0 }
  validates :losses, numericality: { only_integer: true }, :numericality => { :greater_than_or_equal_to => 0 }
  validates :otLosses, numericality: { only_integer: true }, :numericality => { :greater_than_or_equal_to => 0 }

  search_scope :search do
    attributes :name
  end
end
