class Company < ActiveRecord::Base
	has_many :employees
	validates :name,  :email, :website, :address, presence: true
end
