module QuestionHelper
  def data_tag(question)
    number_field_tag :value#, min: question.min, max: question.max, step: question.step
    #case question.answer_type
    #when Question.numeric
    #  #TODO: add min, max, step
    #  number_field_tag :value#, min: question.min, max: question.max, step: question.step
    #when ANSWER_TYPES[:string]
    #  text_field_tag :value
    #when ANSWER_TYPES[:classification]
    #  text_field_tag :value, placeholder: 'FINISH THE CLASSIFICATION DATA'
    #end
  end
end
