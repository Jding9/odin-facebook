class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ show edit update destroy ]

  # GET /friendships or /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1 or /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new(friendship_params)
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships or /friendships.json
  def create
    @friendship = Friendship.new(friendship_params)

    #Deletes the original friend request
    FriendRequest.where(requestor_id: friendship_params.user_id, receiver_id: friendship_params.friend_id).delete
    

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to friend_request_index_url, notice: "Friendship was successfully created." }
        format.json { render :show, status: :created, location: @friendship }
        # deletes the original friend request once the friendship is saved
        @friendrequest = FriendRequest.where(requestor_id: @friendship.user_id, receiver_id: @friendship.friend_id)
        FriendRequest.find(@friendrequest.ids.first).destroy
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendships/1 or /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to friend_request_index_url, notice: "Friendship was successfully updated." }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1 or /friendships/1.json
  def destroy
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to friendships_url, notice: "Friendship was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.permit(:user_id, :friend_id)
    end
end
