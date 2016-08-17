class ClientsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		@clients=current_user.is_admin? ? Client.all : current_user.clients
    end

    def new 
    	@client = Client.new
 	end
 	
 	def create
 		@client =Client.new(client_params)
 		@client.user_id = current_user.id
 		if @client.save
 			redirect_to clients_path
 		else
 			render action: "new"
 		end
 	end
	
	def show
		
		begin
			@client = current_user.is_admin? ? Client.find(params[:id]) : current_user.clients.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to clients_path, notice: "Record Not Found"
		end
	end 
	
	def edit
		@client = current_user.is_admin? ? Client.find(params[:id]) : current_user.clients.find(params[:id])
	end
	def update
		@client = current_user.is_admin? ? Client.find(params[:id]) : current_user.clients.find(params[:id])
		@client.user_id = current_user.id
		if @client.update_attributes(client_params)
			redirect_to client_path(@client.id),notice: "successfully updated"
		else
			render action: "edit"
		end
	end
	
	def destroy
		@client = current_user.is_admin? ? Client.find(params[:id]) : current_user.clients.find(params[:id])
		 @client.destroy
			redirect_to clients_path, notice: "Successfully deleted #{@client.name}"
	end
	
	private
	
	def client_params
		params[:client].permit(:name , :company , :mobile , :email)
	end

end