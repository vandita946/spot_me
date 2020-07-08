class ConnectionsController < ApplicationController
  def index
    # As a user, you can see all your connections on your connections page
    @user = current_user
    @connections = @user.owner_connections
  end

  def search
    # you can search for a @user by name or email
    # if the user is a user of SpotMe, you can click 'add' to create a connection
    # else, you can send an invitation email for the user to join the platform
  end

  def create
    # creates a connection between a user and a buddy, without a goal (no view)
  end

  def show
    # you can click on a connection to see the buddy's profile (= user view)

    # INCLUDE WHEN YOUR MVC IS READY. CHEERS. -JOEL
    ###########################################
    # @connection = Connection.find(params[:id])
    # @chatroom = Chatroom.where(@connection)
    # @message = Message.new
    ###########################################
  end

  def buddies
    # you can filter your list of connection to see who are your current active buddies (= they keep you accountable on a goal)
  end

  def buddyof
    # you can filter your list of connections to see who has requested you as a buddy
  end

  def connectionof
    @user = current_user
    @connections = @user.buddy_connections
  end

  def destroy
    # you can revoke a connection with a buddy from your buddy list or her profile (no view)
  end

  private

  def connection_params
    params.require(:connection).permit(:owner_id, :buddy_id)
  end
end
