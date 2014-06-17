module Api
  class PlacesController < ApplicationController
    load_and_authorize_resource :region
    load_and_authorize_resource :place,  :through => :region

    # GET /places
    # GET /places.json
    def index
      @places = Place.all
    end

    # GET /places/1
    # GET /places/1.json
    def show
    end

    # GET /places/new
    def new
      @place = Place.new
    end

    # GET /places/1/edit
    def edit
    end

    # POST /places
    # POST /places.json
    def create
      @place = @region.places.new(place_params)
      @place.user = current_user
      if @place.save
        render :show, status: :created, location: @place
      else
        render json: @place.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /places/1
    # PATCH/PUT /places/1.json
    def update
      if @place.update(place_params)
        render :show, status: :ok, location: @place
      else
        render json: @place.errors, status: :unprocessable_entity
      end
    end

    # DELETE /places/1
    # DELETE /places/1.json
    def destroy
      @place.destroy
      head :no_content
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    def set_region
      @region = Region.find(params[:region_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:region_id, :name, :description)
    end
  end
end
