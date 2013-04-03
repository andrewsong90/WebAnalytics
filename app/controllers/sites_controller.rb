class SitesController < ApplicationController

  /
	This method sets header for the request that will be sent in response to the CORS request from the client.
	Basically, this will allow access from any site who request CORS request with HTTP POST, GET, or OPTIONS request. 
  /
  def set_cors_headers
	headers["Access-Control-Allow-Origin"] = "*"
	headers["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
	headers["Access-Control-Allow-Headers"] = "Content-Type, Origin, Referer, User-Agent"
	headers["Access-Control-Max-Age"] = "3600"
  end

  /
	This method sends the response to the CORS preflight request
  /
  def resource_preflight
	set_cors_headers
	render :text => "", :content_type => "text/plain"
  end

  /
	When the client sends POST request with values for the site URL, entering time, and leaving time,
	this method will process the request and set values for each of the corresponding attribute in the site object,the page object, and the visit object.
	
	Note that the id is already provided in the snippet, so the controller will look up the existing Site object with its id.
	Page objects will be first searched by its URL to check the existence; if it doesn't exist, new page object will be created
	Visit objects will be created everytime a user visits the site.
  /
  # POST /sites
  def visit
    set_cors_headers
    render :text => "OK here is your restricted resource!"
	
	@site = Site.find(params[:id])
	@site.setValues(params[:siteURL],(params[:enter_time]).to_i,(params[:leave_time]).to_i)

	@page=@site.pages.find_or_create_by_URL(:URL=>params[:sitePath])
	@page.setValues(params[:sitePath],(params[:enter_time]).to_i,(params[:leave_time]).to_i)

	@visit = @page.visits.build
	@visit.setValues(params[:sitePath],(params[:enter_time]).to_i,(params[:leave_time]).to_i)
  end

  /
	This method will enable listing of all the sites tracked.
  /
  # GET /sites
  def index
    @sites = Site.all
  end
  
  /
	This method will show all the visit objects corresponding to the Site object identified by the id
  /
  # GET /sites/:id
  def show
    @site = Site.find(params[:id])
    @pages=@site.pages.all
  end
  
  /
	This method will generate a new Site object with its unique id.
	The html page will display the JavaScript snippet with the unique id for the user to insert into their own websites.
  /
  # GET /sites/new
  def new
    @site = Site.new
    @site.save
  end
  
end
