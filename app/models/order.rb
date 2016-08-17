class Order < ActiveRecord::Base
def products (num)
	prods=[]
		products=Product.where("id =?",num)
		products.each do |p|
			prods.push(p.name)
		end
	return(prods.to_s)
end
def quants (num1)
		prods1=[]
		products1=LineItem.where("product_id =?",num1)
	products1.each do |p|
			prods1.push(p.quantity)
		end
	return(prods1.to_s)
end
def prices (num2)
		prods2=[]
		products2=LineItem.where("product_id =?",num2)
	products2.each do |p|
			prods2.push(p.price)
		end
	return(prods2.to_s)
end
def total (num2)
		prods3=[]
		products3=LineItem.where("product_id =?",num2)
	products3.each do |p|
			prods3.push(p.price*p.quantity)
		end
	return(prods3.to_s)
end
end
