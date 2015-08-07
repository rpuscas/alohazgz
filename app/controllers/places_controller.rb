class PlacesController < ApplicationController

	def index
		@places = Place.all
	end

	def show
		@place = Place.find(params[:id])
	end

	def new
		@place = Place.new
	end

	def create
		@place = Place.new(place_params)

	    if @place.save
	      redirect_to @place
	    else
	      render 'new'
	    end
	end

	def edit
		@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])
		if @place.update_attributes(place_params)
			redirect_to @place
		else
			render 'edit'
		end
	end


	private
      def place_params
        params.require(:place).permit(:name, :address, :postal, :phone, :email, :url, :accesibilidad, :comment, :categoria, :habitaciones, :camas,:latitude,:longitude, :img)
      end
end
