class Registration < ActiveRecord::Base
  # Relationships:
  belongs_to :metric
  belongs_to :user

  # Validations:
  validates_presence_of :metric, :user
end
