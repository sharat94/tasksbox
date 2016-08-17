class ProjectsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		if params[:client_id]
			@projects = current_user.projects.where('client_id = ?', params[:client_id])
		elsif params[:status]
			@projects = current_user.projects.where('status = ?', params[:status])
		else
			@projects = current_user.projects
		end
		@ongoing_task = current_user.projects.where("status = ?","On-Going")
		@new_task = current_user.projects.where("status = ?","New")
		@comp_task = current_user.projects.where("status = ?","Completed")
	end

	def new
		@project = Project.new
	end

	def create
 		@project =Project.new(project_params)
 		@project.user_id = current_user.id
 		if @project.save
 			redirect_to projects_path, notice: "Project successfully created"
 		else
 			render action: "new"
 		end
 	end

 	def show
 		begin
 			@task = Task.new
 			@projects = current_user.projects
 			
 			@project=current_user.projects.find(params[:id])
 			@comp_task = @project.tasks.where('is_completed = ?', true)
 			@incomp_task = @project.tasks.where('is_completed = ?', false)
 		rescue ActiveRecord::RecordNotFound
			redirect_to projects_path, notice: "Record Not Found"
		end
 	end

 	private 
	def project_params
	params[:project].permit(:client_id, :name , :description , :start_date , :end_date, :estimated_budget,  :status, category_ids: [] )
    end

end
