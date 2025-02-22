class City < ApplicationRecord
  has_many :companies, foreign_key: "city_id", class_name: "Company", dependent: :destroy
  validates :title, presence: true
  validates :code, presence: true
end 