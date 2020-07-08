class ConnectionsController < ApplicationController
  def index
    # As a user, you can see all your connections on your connections page

    @user = current_user
    @connections = Connection.where(params[@user_id])
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
  end

  def buddies
    # you can filter your list of connection to see who are your current active buddies (= they keep you accountable on a goal)
  end

  def buddyof
    # you can filter your list of connections to see who has requested you as a buddy
  end

  def destroy
    # you can revoke a connection with a buddy from your buddy list or her profile (no view)
  end

  private

  def connection_params
    params.require(:connection).permit(:user_id, :buddy_id)
  end
end
