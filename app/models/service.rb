class Service < ApplicationRecord
    belongs_to :company, foreign_key: "company_id", class_name: "Company"
    has_many :specialists, foreign_key: "service_id", class_name: "Specialist", dependent: :destroy
end
  