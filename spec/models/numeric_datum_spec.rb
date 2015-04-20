require 'rails_helper'

RSpec.describe NumericDatum, type: :model do
  it {is_expected.to validate_presence_of(:question)}
  it {is_expected.to validate_presence_of(:user)}
  it {is_expected.to validate_presence_of(:value)}
  it {is_expected.to validate_presence_of(:anonymized)}

  it {is_expected.to belong_to(:question)}
  it {is_expected.to belong_to(:user)}

  it {is_expected.to allow_mass_assignment_of(:anonymized)}
  it {is_expected.to allow_mass_assignment_of(:value)}
  it {is_expected.to_not allow_mass_assignment_of(:question)}
  it {is_expected.to_not allow_mass_assignment_of(:user)}
end
