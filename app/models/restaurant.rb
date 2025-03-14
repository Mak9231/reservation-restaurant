class Restaurant < ApplicationRecord
  # Relation avec les réservations
  has_many :reservations
end
