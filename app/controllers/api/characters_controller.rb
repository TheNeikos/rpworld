module Api
  class CharactersController < ApplicationController
    load_and_authorize_resource

    # GET /characters
    # GET /characters.json
    def index
    end

    # GET /characters/1
    # GET /characters/1.json
    def show
    end

    # GET /characters/new
    def new
      @character.moods.build name: "Default"
    end

    # GET /characters/1/edit
    def edit
    end

    # POST /characters
    # POST /characters.json
    def create
      @character = current_user.characters.new(character_params)

      if @character.save
        render :show, status: :created, location: @character
      else
        render json: @character.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /characters/1
    # PATCH/PUT /characters/1.json
    def update
      if @character.update(character_params)
        render :show, status: :ok, location: @character
      else
        render json: @character.errors, status: :unprocessable_entity
      end
    end

    # DELETE /characters/1
    # DELETE /characters/1.json
    def destroy
      @character.destroy
      head :no_content
    end

    private

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:name,
                                        :description,
                                        :moods_attributes => [
                                          :name,
                                          :description,
                                          :picture])
    end
  end
end
