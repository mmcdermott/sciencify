require 'rails_helper'

RSpec.describe Registration, :type => :model do
  it {is_expected.to validate_presence_of(:metric)}
  it {is_expected.to validate_presence_of(:user)}

  it {is_expected.to belong_to(:metric)}
  it {is_expected.to belong_to(:user)}

  it {is_expected.to allow_mass_assignment_of(:expiration_date)}
  it {is_expected.to allow_mass_assignment_of(:frequency)}

  it {is_expected.to_not allow_mass_assignment_of(:metric)}
  it {is_expected.to_not allow_mass_assignment_of(:user)}
end
