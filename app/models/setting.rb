class Setting < ApplicationRecord
  # Direct associations

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
