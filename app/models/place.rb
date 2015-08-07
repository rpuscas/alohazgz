class Place < ActiveRecord::Base

  before_save :geolocalize

  private

	  def geolocalize
	    if self.latitude==0 and self.longitude==0
	      results = Geocoder.search(address)

	      if results.size > 0
	        self.latitude = results.first.latitude
	        self.longitude = results.first.longitude
	      end
	    end
	  end	

end
