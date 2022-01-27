class Type < ApplicationRecord
  has_and_belongs_to_many :pokemons
  
  validates_presence_of :name
end
