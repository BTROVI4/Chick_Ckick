class Specialist < ApplicationRecord
    belongs_to :service
    has_many :datas, dependent: :destroy  
    validates :name, presence: true
    validates :speciality, presence: true
    validates :characteristic, presence: true
  end
    