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

	def filter_hoteles
		@places = Place.where("categoria like '%otel%'")
		render 'index'
	end

	def filter_hostales
		@places = Place.where("categoria like '%ostal%'")
		render 'index'
	end

	def filter_albergues
		@places = Place.where("categoria like '%alberg%'")
		render 'index'
	end

	def filter_pensiones
		@places = Place.where("categoria like '%pensi%'")
		render 'index'
	end

	def filter_aparts
		@places = Place.where("categoria like '%apart%'")
		render 'index'
	end


	private
      def place_params
        params.require(:place).permit(:name, :address, :postal, :phone, :email, :url, :accesibilidad, :comment, :categoria, :habitaciones, :camas,:latitude,:longitude, :img)
      end
end
