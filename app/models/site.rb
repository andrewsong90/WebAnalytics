class Site < ActiveRecord::Base
  
  /
	self.url : Site URL for this site object
	self.visit_counts : Count for the number of visits
	self.duration : Total duration spent by the users on the site
  /
  attr_accessible :url, :visit_counts, :duration
  #A Site object has many Visit objects
  has_many :pages

  /
	This method will set the attributes of the Site object with the values passed in by POST request from the client side.
	@modifies self.visit_counts, self.url, self.duration
	@requires enter_time!=nil & leave_time!=nil & self.visit_counts >= 0
  /
  def setValues(url,enter_time,leave_time)
    self.visit_counts=self.visit_counts+1
	self.url=url
	self.duration=self.duration+leave_time-enter_time
	self.save
  end

 end
