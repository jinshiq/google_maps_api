class PlacesController < ApplicationController

  def index
	@places = Place.order('created_at DESC')
  end

  def new
	@place = Place.new
  end
  
  def create
	@place = Place.new(place_params)
	if @place.save
		flash[:success] = "Place added!"
		redirect_to root_path
	else
		render 'new'
	end
  end
  
  def show
	@place = Place.find(params[:id])
  end
  
  def destroy
	@place = Place.find(params[:id])
	@place.destroy
	redirect_to root_path, notice: 'Place was successfully destroyed.'	
  end
   
  def about
  end
  
  
  private
	
  def place_params
	params.require(:place).permit(:title, :raw_address, :latitude, :longitude, :visited_by)
  end
  
end
