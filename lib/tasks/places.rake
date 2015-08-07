require 'httparty'

namespace :places do
  desc "Import places to stay from Ayuntamiento"
  task import: :environment do
    response = HTTParty.get('http://www.zaragoza.es/api/recurso/turismo/alojamiento.json?rf=html&results_only=false&srsname=wgs84&rows=144') 
    data = response["result"]

    data.each do |item|
    	
    	coor = [0,0]
     	if item["geometry"]
    	  coor = item["geometry"]["coordinates"]
    	end

    	imagen = ""
    	if item["image"]
    		imagen = item["image"]
       	end

    	Place.create!(
    		name: item["title"],
		    address: item["streetAddress"],
		    postal: item["postalCode"],
		    phone: item["telefonos"],
		    email: item["email"],
		    url: item["url"],
		    accesibilidad: item["accesibilidad"],
		    comment: item["comment"],
		    categoria: item["categoria"],
		    habitaciones: item["habitaciones"],
		    camas: item["camas"],
		    img: "http://www.zaragoza.es" + imagen,
		    latitude: coor[1],
		    longitude: coor[0]
    	)
    end
  end

end
