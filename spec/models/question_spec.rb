require 'rails_helper'

RSpec.describe Question, type: :model do
  it {is_expected.to validate_presence_of(:question)}
  it {is_expected.to validate_presence_of(:input_label)}

  it {is_expected.to have_many(:numeric_data)}
  it {is_expected.to have_many(:users).through(:numeric_data)}
  it {is_expected.to belong_to(:metric)}

  it {is_expected.to allow_mass_assignment_of(:answer_type)}
  it {is_expected.to allow_mass_assignment_of(:question)}
  it {is_expected.to allow_mass_assignment_of(:input_label)}
  it {is_expected.to_not allow_mass_assignment_of(:metric)}

  context 'Numeric Questions' do
    subject(:question) {Question.create(answer_type: 'numeric',
                                        question: 'Question',
                                        input_label: 'Label')}

    it {is_expected.to be_numeric}
    it 'returns the correct type of data' do
      expect(question).to receive :numeric_data
      question.data
    end
  end
end
