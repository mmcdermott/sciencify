class Metric < ActiveRecord::Base
  #Relationships:
  has_many :questions, dependent: :destroy
  has_many :numeric_data, through: :questions, dependent: :destroy
  has_many :users, through: :registrations
  has_many :registrations
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  #Validations:
  validates_presence_of :questions, :creator, :name, :description
  validates_inclusion_of :published, in: [true, false]

  accepts_nested_attributes_for :questions

  #Scopes:
  scope :viewable, -> {where(published: true)}
  #TODO make the below work.
  #scope :viewable_and_owned_by (user) -> {where(published:true)

  #Methods: 
  def data_count
    numeric_data.count
  end
end
