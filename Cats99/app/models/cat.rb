class Cat < ApplicationRecord
  COLORS = %w(blue red orange black white yellow)

  validates :color, inclusion: { in: COLORS, message: "Color is a not a valid color!"}
  validates :color, :birth_date, :name, :sex, :description, presence: true

  def age
    age = DateTime.now.year - self.birth_date.year
    age
  end
end
