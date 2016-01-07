class Pizza < ActiveRecord::Base
  has_many :pizza_ingredients
  has_many :ingredients, through: :pizza_ingredients
  accepts_nested_attributes_for :ingredients, allow_destroy: true,
    reject_if: :check_empty_or_duplicate

  validates :name, presence: true

  def check_empty_or_duplicate(ingredient)
    return true if ingredient[:name].blank?

    unless Ingredient.find_by_name(ingredient[:name]).blank?
      return true if Ingredient.find_by_name(ingredient[:name])
                      .pizza.map(&:id).include? self.id
    end

    return false
  end

  def to_s
    name
  end
end
