class Specialist < ApplicationRecord
    belongs_to :service
    has_many :data, dependent: :destroy  
    validates :name, presence: true
    validates :speciality, presence: true
    validates :characteristic, presence: true
  end
    