class Specialist < ApplicationRecord
  belongs_to :service, foreign_key: "service_id", class_name: "Service"
  has_many :appointments, foreign_key: "specialist_id", class_name: "Appointment", dependent: :destroy

  validates :title, presence: true
  validates :speciality, presence: true
  validates :info, presence: true

end