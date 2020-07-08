class CompletionMessagesController < ApplicationController

    def new
        @milestone = Milestone.find(params[:milestone_id])
        @completion_message = CompletionMessage.new
    end

    def create
        @milestone = Milestone.find(params[:milestone_id])
        @completion_message = CompletionMessage.new(milestone_params)
    end

    private

    def milestone_params
        
    end
end
