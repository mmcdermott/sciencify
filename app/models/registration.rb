class Registration < ActiveRecord::Base
  # Relationships:
  belongs_to :metric
  belongs_to :user

  # Validations:
  validates_presence_of :metric, :user
  validates_uniqueness_of :user, scope: :metric
end
