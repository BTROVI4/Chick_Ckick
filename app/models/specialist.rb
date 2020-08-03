class Specialist < ApplicationRecord
  belongs_to :service, foreign_key: "service_id", class_name: "Service"
  has_many :whours, foreign_key: "specialist_id", class_name: "Whour", dependent: :destroy
  has_many :appoiments, foreign_key: "specialist_id", class_name: "Appoiment", dependent: :destroy

  validates :title, presence: true
  validates :speciality, presence: true
  validates :info, presence: true

end