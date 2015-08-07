require 'httparty'

namespace :places do
  desc "Import places to stay from Ayuntamiento"
  task import: :environment do
    response = HTTParty.get('http://www.zaragoza.es/api/recurso/turismo/alojamiento?rf=html&results_only=false&srsname=utm30n&rows=144') 
    
  end

end
