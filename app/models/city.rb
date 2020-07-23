class City < ApplicationRecord
    has_many :companies, dependent: :destroy
    validates :title, presence: true
    validates :code, presence: true
  end
  