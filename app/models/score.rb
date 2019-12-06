class Score < ApplicationRecord
  # Direct associations

  belongs_to :setting,
             :counter_cache => true

  # Indirect associations

  # Validations

end
