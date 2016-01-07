class Ingredient < ActiveRecord::Base
  has_many :pizza_ingredients
  has_many :pizza, through: :pizza_ingredients
  validates :name, presence: true

  def self.autocomplete_query(query)
    query = "%#{query}%"
    where("ingredients.name ILIKE?", query).
      order("name ASC").
      limit(5).
      map(&:name)
  end

  def to_s
    name
  end
end
