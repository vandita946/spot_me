class CompletionMessagesController < ApplicationController

    def new
        @milestone = Milestone.find(params[:milestone_id])
        @completion_message = CompletionMessage.new
    end

    def create
        @milestone = Milestone.find(params[:milestone_id])
        @completion_message = CompletionMessage.new(completion_message_params)
        @milestone.completion_message = @completion_message
        if @completion_message.save
            @milestone.is_completed = true
            @milestone.save
            redirect_to goals_path, notice: "Congrats dude!"
        else
            render :new
        end
    end

    private

    def completion_message_params
        params.require(:completion_message).permit(:content)
    end
end
