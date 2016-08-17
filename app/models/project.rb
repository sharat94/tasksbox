class Project < ActiveRecord::Base
	belongs_to :client
	belongs_to :user
	has_many :tasks
	before_destroy :destroy_project

	has_many :project_categories
	has_many :categories, through: :project_categories

	validates_presence_of :name, :description, :start_date, :end_date, :client_id, :estimated_budget , :status
	validates_length_of :description, minimum: 10
	validates_numericality_of :client_id

	def completed
		self.tasks.where('is_completed = ?',true)
	end
	def incompleted
		self.tasks.where('is_completed = ?',false)
	end
	def self.new_projects
		Project.where('status = ?',"new")
	end

	def destroy_project
		self.tasks.each do |task|
			task.destroy 
		end
	end
	private

	def check_date
		if (!self.end_date.nil? && !self.start_date.nil?) && (self.end_date <= self.start_date)
			errors.add(:end_date, "Should be greater than start date")
		end
	end
end


