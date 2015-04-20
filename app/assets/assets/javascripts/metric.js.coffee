numQuestions = 5
numHidden    = 5
showQuestion = ->
  if numHidden == 1
    $('.questionInput.hidden').first().removeClass('hidden')
    $('#AddQuestion').hide()
  else
    $('.questionInput.hidden').first().removeClass('hidden')
  numHidden -= 1
showQuestion()
$('#AddQuestion').on 'click', -> showQuestion()
