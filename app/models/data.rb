class Data < ApplicationRecord
    belongs_to :specialist, dependent: :destroy
    validates :month, presence: true
    validates :year, presence: true
    validates :day, presence: true
    validates :time, presence: true
end
  