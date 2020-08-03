class Whour < ApplicationRecord
    belongs_to :specialist, foreign_key: "specialist_id", class_name: "Specialist"
end