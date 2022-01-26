class Pokemon < ApplicationRecord
  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :types
  belongs_to :user
end
