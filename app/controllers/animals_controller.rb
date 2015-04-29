class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.create(animal_params)
    redirect_to :animals
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
  @animal = Animal.update(params[:id], animal_params)
  redirect_to :animals
    unless @animal
      redirect_to :edit
    end
  end

  def destroy
  @animal = Animal.destroy(params[:id])
  redirect_to :animals
  end

  private

  def animal_params
    params.require(:animal).permit(:name,:desc,:species)
  end

end