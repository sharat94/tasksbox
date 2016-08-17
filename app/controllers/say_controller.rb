class SayController < ApplicationController

	authorize_resource class: false
	
  def hello
  end
end
