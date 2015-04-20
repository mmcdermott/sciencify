class MetricsController < ApplicationController
  def new
    @metric = Metric.new
    5.times {@metric.questions.build}
  end

  def create
    params[:metric][:questions_attributes].each do |key, value|
      params[:metric][:questions_attributes].delete(key) if value[:question].empty?
    end
    @metric = Metric.new metric_params
    @metric.creator_id = current_user.id
    # TODO make this an option!!
    #@metric.published = false
    if @metric.save
      flash[:notice] = "Metric Created Successfully!"
      redirect_to @metric
    else
      logger.info "Metric failed.\n #{@metric.attributes.inspect}\n #{@metric.errors.full_messages}"
      flash[:alert] = "Oops! Something went wrong."
      redirect_to '#' # Make this go back to the form upon error.
    end
  end 

  def show
    @metric = Metric.find(params[:id])
    @questions = @metric.questions
    # TODO: Maybe make metric show page have more summary stats, like how many
    # users have submitted, and global data or something? For now, this is fine,
    # but in the end we'll want to shift to that. 
  end

  def index
    @metrics = Metric.viewable
    #@metrics = Metric.viewable_and_owned_by current_user
  end

  private
    def metric_params
      params.require(:metric).permit(:name,
                                     :description, 
                                     :frequency,
                                     :published,
                                     questions_attributes: [:answer_type,
                                                            :question,
                                                            :input_label,
                                                            :metric_id])
    end
end
