class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.create(animal_params)
    redirect_to @animal
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to @animal
    else render 'edit'
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy
    p animals_path
    redirect_to animals_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name,:desc,:species)
  end

end