class Question < ActiveRecord::Base
  enum answer_type: [:numeric]

  # Validations: 
  validates_presence_of :question
  validates_presence_of :input_label

  # Relationships:
  # TODO: maybe numeric_data should be polymorphic?
  has_many :numeric_data
  has_many :users, through: :numeric_data
  belongs_to :metric

  def data
    if numeric? 
      return numeric_data
    end
  end
end
