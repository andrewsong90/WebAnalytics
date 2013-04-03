class Page < ActiveRecord::Base

  /
	self.URL : Page URL (subpath for the page) for this site object
	self.visit_counts : Count for the number of visits to the page
	self.duration : Total duration spent by the users on the page
  /

  attr_accessible :URL, :duration, :visit_counts
  has_many :visits
  belongs_to :site, :foreign_key => :site_id
  
  /
	This method will set the attributes of the Page object with the values passed in by POST request from the client side.
	@modifies self.visit_counts, self.URL, self.duration
	@requires enter_time!=nil & leave_time!=nil & self.visit_counts >= 0
  /
  
  def setValues(url,enter_time,leave_time)
	self.URL=url
	self.duration=self.duration+leave_time-enter_time
	self.visit_counts=self.visit_counts+1
	self.save
  end
  
end
