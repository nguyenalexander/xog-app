require 'flickraw'
require 'awesome_print'


FlickRaw.api_key=ENV["F_KEY"]
FlickRaw.shared_secret=ENV["F_SECRET"]


class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
    @tags = Tag.all
  end

  def create
    @animal = Animal.create(animal_params)
    tags = params[:animal][:tag_ids]
    tags.each do |t|
      @animal.tags << Tag.find(t) unless t.blank?
    end
    redirect_to :animals
  end

  def show
    @animal = Animal.find(params[:id])
    list = flickr.photos.search :text => @animal.name, :sort => "relevance", :per_page => 10
    @photos = list.map do |i|
      photo_info = flickr.photos.getInfo :photo_id => i.id
      {:photo => FlickRaw.url_z(i), :url => photo_info.urls[0]._content}
    end
    @photo = @photos.sample
  end

  def edit
    @animal = Animal.find(params[:id])
    @tags = Tag.all
  end

  def update
  @animal = Animal.update(params[:id], animal_params)
  @animal.tags.clear
    tags = params[:animal][:tag_ids]
    tags.each do |t|
      @animal.tags << Tag.find(t) unless t.blank?
    end
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