class MessagesController < ApplicationController

    def create
        @chatroom = Chatroom.find(params[:chatroom_id])
        @message = Message.new(message_params)
        @message.chatroom = @chatroom
        @message.user = current_user
        if @message.save
            ChatroomChannel.broadcast_to(
                @chatroom,
                render_to_string(partial: "message", locals: { message: @message })
            )
            if @chatroom.topic.class == Goal
                # render URI(request.referrer).path, alert: "#{request.referrer}"
                if request.referrer.include?("goals")
                  redirect_to goal_path(@chatroom.topic, anchor: "message-#{@message.id}")
                elsif request.referrer.include?("feeds")
                  redirect_to request.referrer
                end

            elsif @chatroom.topic.class == Connection
                redirect_to connection_path(@chatroom.topic, anchor: "message-#{@message.id}")
            else
                redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
            end
            # redirect_to URI(request.referrer).path(anchor: "message-#{@message.id}"), notice: "works"
        else
            # redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
            # redirect_to request.referrer, alert: "There was an error in message"
          render URI(request.referrer).path, alert: "There was an error in message" # "chatrooms/show"
        end
    end

    private

    def message_params
        # PROBABLY REQUIRES SOME CHANGES TO THE PERMIT
        params.require(:message).permit(:chatroom_id, :user_id, :content)
    end

end
