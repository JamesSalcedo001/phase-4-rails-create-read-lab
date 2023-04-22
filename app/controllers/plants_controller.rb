class PlantsController < ApplicationController
    def index
        all_plants = Plant.all
        render json: all_plants
    end

    def show
        single_plant = Plant.find_by(id: params[:id])
        if single_plant
            render json: single_plant
        else
            render json: { error: "No plant here" }, status: :not_found
        end
    end

    def create
        new_plant = Plant.create(plant_params)
        render json: new_plant, status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end
