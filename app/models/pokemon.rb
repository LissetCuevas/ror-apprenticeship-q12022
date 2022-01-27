class Pokemon < ApplicationRecord
  has_and_belongs_to_many :abilities
  has_and_belongs_to_many :types
  belongs_to :user, optional: true

  validates_presence_of :name
  validates_uniqueness_of :name
  validates_numericality_of :height, :weight, :order, :base_experience
end
