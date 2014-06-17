module Api
  class RegionsController < ApplicationController
    load_and_authorize_resource
    # GET /regions
    # GET /regions.json
    def index
      @regions = Region.all
    end

    # GET /regions/1
    # GET /regions/1.json
    def show
    end

    # GET /regions/new
    def new
      @region = Region.new
    end

    # GET /regions/1/edit
    def edit
    end

    # POST /regions
    # POST /regions.json
    def create
      @region = Region.new(region_params)

      if @region.save
        format.json { render :show, status: :created, location: @region }
      else
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end

    # PATCH/PUT /regions/1
    # PATCH/PUT /regions/1.json
    def update
      if @region.update(region_params)
        format.json { render :show, status: :ok, location: @region }
      else
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end

    # DELETE /regions/1
    # DELETE /regions/1.json
    def destroy
      @region.destroy
      format.json { head :no_content }
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def region_params
      params.require(:region).permit(:name, :description)
    end
  end
end
