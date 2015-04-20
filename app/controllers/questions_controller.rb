class QuestionsController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def index
    @metric = Metric.find params[:metric_id]
    @questions = @metric.questions
  end

  def submit
    question = Question.find(params[:id])
    if question.data.create(value: params[:value], user_id: current_user.id,
                            anonymized: true)
      flash[:notice] = "Data submitted!"
      redirect_to question.metric
    else
      flash[:alert] = "Oops! We could save your data for some reason."
      redirect_to '#'
    end
  end
end
