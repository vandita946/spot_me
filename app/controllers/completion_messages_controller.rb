class CompletionMessagesController < ApplicationController

    def new
        @milestone = Milestone.find(params[:milestone_id])
        @completion_message = CompletionMessage.new
    end

    def create
        @milestone = Milestone.find(params[:milestone_id])
        @completion_message = CompletionMessage.new(completion_message_params)
    end

    private

    def completion_message_params
        params.require(:completion_message).permit(:content)
    end
end
