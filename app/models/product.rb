class Product < ActiveRecord::Base
	belongs_to :product_category
	has_many :items_totalprice
		
	def to_param
		"#{self.name}"
	end


	def stockprice(units,price)
		return(units.to_i*price.to_i)
	end
	

	def self.prodprice
		sum=0
		Product.all.each do |item|
		sum+=item.price
		end
		return sum
	end
	
	def self.stocktotal
		total=0
		Product.all.each do |item|
		total+=(item.unit.to_i*item.price.to_i)
		end
		return total
	end
end
