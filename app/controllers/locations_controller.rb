class LocationsController < ApplicationController
  
  def index
    puts ENV["ZIP_KEY"]
  end

  def create
    respond_to do |format|
      key = ENV["ZIP_KEY"].to_s
      zip1 = params[:zip1]
      zip2 = params[:zip2]
      url = 'http://www.zipcodeapi.com/rest/'+key+'/distance.csv/'+zip1+'/'+zip2+'/km'
      @data = Curl.get(url)
      format.html { render html: @data.body_str}
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:zip1, :zip2)
    end
end
