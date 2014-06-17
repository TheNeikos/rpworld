module Api
  class RepliesController < ApplicationController
    load_and_authorize_resource :region
    load_and_authorize_resource :place,  :through => :region
    load_and_authorize_resource :reply,  :through => :place

    # GET /replies
    # GET /replies.json
    def index
      @replies = Reply.all
    end

    # GET /replies/1
    # GET /replies/1.json
    def show
    end

    # GET /replies/new
    def new
      @reply = Reply.new
    end

    # GET /replies/1/edit
    def edit
    end

    # POST /replies
    # POST /replies.json
    def create
      @reply = @place.replies.new(reply_params)
      @reply.user = current_user
      if @reply.save
        render :show, status: :created, location: @reply
      else
        render json: @reply.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /replies/1
    # PATCH/PUT /replies/1.json
    def update
      if @reply.update(reply_params)
        render :show, status: :ok, location: @reply
      else
        render json: @reply.errors, status: :unprocessable_entity
      end
    end

    # DELETE /replies/1
    # DELETE /replies/1.json
    def destroy
      @reply.destroy
      head :no_content
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply
      @reply = Reply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:place_id, :user_id, :character_id, :body)
    end
  end
end
