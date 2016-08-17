class Task < ActiveRecord::Base
belongs_to :project



	def details
		"Title-#{self.title} </br> due_date-#{self.due_date} </br> is_completed-#{self.is_completed} <br />"
	end
private
	def check_date 
		if (self.due_date < self.project.start_date || self.due_date > self.project.end_date) 
		errors.add(:due_date,"is invalid")

		end
	end
end