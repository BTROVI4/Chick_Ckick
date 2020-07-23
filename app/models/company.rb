class Company < ApplicationRecord
    belongs_to :city
    # has_many :service, dependent: :destroy
    # validates :companyname, presence: true
    # validates :adress, presence: true
end
  