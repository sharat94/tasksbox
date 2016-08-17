class AnouncementsController < ApplicationController
	before_action :authenticate_user!

	def index
		@anouncements=current_user.anouncements
	end

		def new
			@anouncement=Anouncement.new
		end

		def show
		
			begin
				@anouncement = current_user.anouncements.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				redirect_to clients_path, notice: "Record Not Found"
			end
		end

			def create
 					@anouncement =Anouncement.new(anouncement_params)
 					@anouncement.user_id = current_user.id
 				if @anouncement.save
 					Anounce.completed(@anouncement, current_user).deliver!
 					redirect_to anouncements_path
 				else
 					render action: "new"
 				end
 			end
 	private
 	def anouncement_params
		params[:anouncement].permit(:title , :body)
	end
end