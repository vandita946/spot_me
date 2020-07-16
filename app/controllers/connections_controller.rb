class ConnectionsController < ApplicationController
  def index
    # As a user, you can see all your connections on your connections page
    # buddies: you can see who are your current active buddies (= they keep you accountable on a goal)
    # buddyof: you can see who has requested you as a buddy
    # connectionof: you can see who added you as a connection
    @user = current_user
    @connections = policy_scope(Connection)
    @connections = @user.owner_connections
    @fans = @user.buddy_connections
    @buddies = @user.buddies
    @buddyofs = @user.buddyofs
    @goal_connection = GoalConnection.new
  end

  def search
    # you can search for a @user by name or email
    # if the user is a user of SpotMe, you can click 'add' to create a connection
    # else, you can send an invitation email for the user to join the platform
  end

  def create
    # creates a connection between a user and a buddy, without a goal (no view)
    @connection = Connection.new(connection_params)
    authorize @connection
    @connection.owner_id = current_user.id
    @chatroom = Chatroom.new(topic: @connection)
    authorize @chatroom
      if @connection.save && @connection.save
        redirect_to connections_path, notice: "You have added #{buddy.firstname} to your connections"
      else
        render "new", alert: "Something went wrong"
      end
  end

  def show
    # should show the chatroom for this connection
    @connection = Connection.find(params[:id])
    @chatroom = Chatroom.where(topic: @connection)[0]
    @message = Message.new
    authorize @connection
    authorize @chatroom
    authorize @message
  end


  def destroy
    # you can revoke a connection with a buddy from your buddy list or her profile (no view)
  end

  private

  def connection_params
    params.require(:connection).permit(:owner_id, :buddy_id)
  end

end


