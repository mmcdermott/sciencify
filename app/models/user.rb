class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :confirmable

  #attr_accessible :email, :password, :password_confirmation, :remember_me

  #Relationships:
  has_one :profile
  has_many :registrations
  has_many :numeric_data
  has_many :metrics, through: :registrations
  has_many :created_metrics, class_name: 'Metric', inverse_of: :creator, foreign_key: 'creator_id'
  has_many :questions, through: :numeric_data

  #Callbacks:
  after_create :make_profile

  def registered_for metric
    !(self.registrations.where(metric_id: metric.id).empty?)
  end

  private

  def make_profile
    self.create_profile
  end
end
