class Setting < ApplicationRecord
  # Direct associations

  has_many   :scores,
             :dependent => :destroy

  belongs_to :owner,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

end
