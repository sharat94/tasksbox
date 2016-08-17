class Employee < ActiveRecord::Base
	belongs_to :company
	belongs_to :department
	before_create :generate_employee_code

	def generate_employee_code
		self.code = "#{self.first_name[0..2]} "
	end 
end
