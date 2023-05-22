class FriendRequestController < ApplicationController
    def index
        @users = User.all
        # to do - have a filtered table for only people that aren't friends and aren't requested
        @incoming_requests = current_user.incoming_requests
        @outgoing_requests = current_user.outgoing_requests
    end

    def new
        @friend_request = FriendRequest.new(friend_request_params)
    end

    def create
        @friend_request = FriendRequest.new(friend_request_params)

        respond_to do |format|
          if @friend_request.save
            format.html { redirect_to friend_request_index_url, notice: "Friend Request was successfully sent." }
            format.json { render :index, status: :created, location: @friend_request }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @friend_request.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @friend_request = FriendRequest.find(params[:id])
        @friend_request.destroy
    
        respond_to do |format|
          format.html { redirect_to friend_request_index_url, notice: "Friend Request was successfully deleted." }
          format.json { head :no_content }
        end
    end

    private
    def friend_request_params
        params.permit(:requestor_id, :receiver_id)
    end
end
