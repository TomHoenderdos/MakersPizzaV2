class Pizza < ActiveRecord::Base
  has_many :pizza_ingredients
  has_many :ingredients, through: :pizza_ingredients
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  validates :name, presence: true

  def to_s
    name
  end
end
