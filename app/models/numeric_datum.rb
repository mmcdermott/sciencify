class NumericDatum < ActiveRecord::Base
  # Attributes:
  #  See if user_id can be edit-prohibited after creation.

  # Relationships:
  belongs_to :question
  belongs_to :user

  # Validations:
  validates_presence_of :question, :user, :value, :anonymized
end
