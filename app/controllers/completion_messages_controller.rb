class CompletionMessagesController < ApplicationController
  def new
    @milestone = Milestone.find(params[:milestone_id])
    @completion_message = CompletionMessage.new
    authorize @milestone
    authorize @completion_message
  end

  def create
    @milestone = Milestone.find(params[:milestone_id])
    @completion_message = CompletionMessage.new(completion_message_params)
    authorize @milestone
    authorize @completion_message
    @milestone.completion_message = @completion_message
    if @completion_message.save
      @milestone.is_completed = true
      @milestone.save
      redirect_to request.referrer, notice: "Another step closer! "
    else
      redirect_to request.referrer, notice: "Your milestone couldn't be marked as complete. "
    end
  end

  private

  def completion_message_params
    params.require(:completion_message).permit(:content)
  end
end
