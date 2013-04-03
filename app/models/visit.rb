class Visit < ActiveRecord::Base
  
  
  /
	self.url : Site URL for the site object associated with the visit object.
	self.duration : Duration for each visit
	self.enter_time : Timestamp for when the visit was initiated.
	self.leave_time : Timestamp for when the visit was terminated.
	site_id : Foreign key for associating a Site object with multiple Visit objects
  /
  attr_accessible :url, :duration, :enter_time, :leave_time
  
  #Visit objects belong to a specific site object
  belongs_to :page, :foreign_key => :page_id
  
/
	This method will set the attributes of the Visit object with the values passed in by POST request from the client side.
	@modifies  self.url, self.duration, self.enter_time, self.leave_time
	@requires enter_time!=nil & leave_time!=nil
  /  
  def setValues(url,enter_time,leave_time)
	self.url=url
	self.duration=leave_time-enter_time
	self.enter_time=enter_time
	self.leave_time=leave_time
	self.save
  end

end
