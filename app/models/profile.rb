class Profile < ActiveRecord::Base
  # Attributes:
  #attr_accessible :bio, :nickname

  # Relationships:
  belongs_to :user

  # Validations:
  validates_presence_of :user
end
