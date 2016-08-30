class SearchesController < ApplicationController

  def index
	@range = params[:q1]
	@address = params[:q2]
	@places = Place.near(@address, @range )
    @hash = Gmaps4rails.build_markers(@places) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
	  marker.infowindow place.title
	  # marker.picture({
		# "url" => "https://addons.cdn.mozilla.net/img/uploads/addon_icons/13/13028-64.png",
		# "width" => 32,
		# "height" => 32
		# })
	  # marker.json({ title: place.title})
    end 
  end

end
