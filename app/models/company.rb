class Company < ApplicationRecord
    belongs_to :city, foreign_key: "city_id", class_name: "City"
    has_many :services, foreign_key: "company_id", class_name: "Service", dependent: :destroy
    
end
  