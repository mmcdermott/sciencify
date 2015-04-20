require 'rails_helper'

RSpec.describe Profile, type: :model do
  it {is_expected.to validate_presence_of(:user)}

  it {is_expected.to belong_to(:user)}

  it {is_expected.to allow_mass_assignment_of(:bio)}
  it {is_expected.to allow_mass_assignment_of(:nickname)}
  it {is_expected.to_not allow_mass_assignment_of(:user)}
end
