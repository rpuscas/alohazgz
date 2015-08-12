class PlacesController < ApplicationController

	def index
		@places = Place.all.paginate(:page => params[:page])
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
		@places = Place.where("categoria like '%otel%'").paginate(:page => params[:page])
		render 'index'
	end

	def filter_hostales
		@places = Place.where("categoria like '%ostal%'").paginate(:page => params[:page])
		render 'index'
	end

	def filter_albergues
		@places = Place.where("categoria like '%lberg%'").paginate(:page => params[:page])
		render 'index'
	end

	def filter_pensiones
		@places = Place.where("categoria like '%ensi%'").paginate(:page => params[:page])
		render 'index'
	end

	def filter_aparts
		@places = Place.where("categoria like '%partam%'").paginate(:page => params[:page])
		render 'index'
	end

	def filter_campings
		@places = Place.where("categoria like '%amping%'").paginate(:page => params[:page])
		render 'index'
	end

	def mapa
		@places = Place.all
		render 'mapa'
	end

	private
      def place_params
        params.require(:place).permit(:name, :address, :postal, :phone, :email, :url, :accesibilidad, :comment, :categoria, :habitaciones, :camas,:latitude,:longitude, :img)
      end
end
