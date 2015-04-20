require 'rails_helper'

RSpec.describe Metric, type: :model do
  it {is_expected.to belong_to(:creator).class_name(User)}
  it {is_expected.to have_many(:questions)}
  it {is_expected.to have_many(:numeric_data).through(:questions)}

  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:questions)}
  it {is_expected.to validate_presence_of(:creator)}
  it {is_expected.to validate_presence_of(:published)}
  it {is_expected.to validate_presence_of(:description)}

  it {is_expected.to allow_mass_assignment_of(:description)}
  it {is_expected.to allow_mass_assignment_of(:frequency)}
  it {is_expected.to allow_mass_assignment_of(:published)}
  it {is_expected.to allow_mass_assignment_of(:name)}
  it {is_expected.to allow_mass_assignment_of(:questions_attributes)}
  it {is_expected.to_not allow_mass_assignment_of(:creator_id)}

  context 'with questions' do
    let(:question1) {Question.new(answer_type: Question.numeric,
                                  question: 'question1',
                                  input_label: 'input_label')}
    let(:question2) {Question.new(answer_type: Question.numeric,
                                  question: 'question2',
                                  input_label: 'input_label')}
    subject(:metric) {Metric.new(description: 'description',
                                 frequency: 1,
                                 published: true,
                                 name: 'name',
                                 questions: [question1, question2])}
    it 'Should accept questions' do
      expect(metric.questions).to include(question1, question2)
    end
    
    it 'Should count data' do
      # TODO Need integration test for this kind of functionality.
      expect(metric.numeric_data).to receive(:count).and_return(2)
      expect(metric.data_count).to equal(2)
    end
  end
end
