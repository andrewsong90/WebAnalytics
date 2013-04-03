class PageController < ApplicationController

  /
	This method, by rendering the show html page, will display all the visit objects and their detials for the specific page. 
  /
  # GET /sites/:id/pages/:num
  def show
    @page = Page.find(params[:num])
    @visits=@page.visits.all
  end
  
end
