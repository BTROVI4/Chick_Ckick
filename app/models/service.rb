class Service < ApplicationRecord
    belongs_to :company
    has_many :specialist, dependent: :destroy
    validates :servicename, presence: true
    validates :cost, presence: true
end
  