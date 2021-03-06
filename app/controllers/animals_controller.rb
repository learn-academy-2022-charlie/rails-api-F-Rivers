class AnimalsController < ApplicationController

    def index
      animals = Animal.all 
      render json: animals
    end 

    def show 
        animal = Animal.find(params[:id])
        render json: animal.as_json(include: :sightings)
    end

    def create
        animal= Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end

    def destroy
        animal= Animal.destroy(params[:id])
        animals = Animal.all
        animal.destroy
        render json: animals
    end

    def update
        animal= Animal.update(params[:id])
        if animal.update(animal_params)
            render json: animal
        else
            render json: animal.errors
        end
    end

    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end 

end
