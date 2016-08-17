15.times 	do 
	client = Client.new
	client.name = Faker::Name.first_name
	client.company = Faker::Company.name 
	client.email = Faker::Internet.free_email(client.name)
	client.mobile = Faker::Number.number(10)
	client.website = Faker::Internet.domain_name
	client.save
end

100.times do
	project = Project.new
	project.name = Faker::App.name 
	project.description = Faker::Lorem.sentence
	project.start_date = Faker::Date.between(Date.today.beginning_of_year,Date.today)
	project.end_date = Faker::Date.between(Date.today,Date.today+3.months)
	project.client_id= Client.all.pluck(:id).sample
	project.save
end

100.times do
	product = Product.new
	product.name = Faker::App.name 
	product.price = Faker::Number.number(3)
	product.available_from = Faker::Date.between(Date.today,Date.today+2.months)
	product.category=Category.all.pluck(:id).sample
	product.unit=Faker::Number.between(100,1000)
	product.in_stock=Faker::Boolean.boolean(0.2)
	product.save
end
10.times do 
	category= Category.new
	category.name= Faker::Commerce.department(1)
	category.save
end

20.times do 
	order = Order.new
	order.order_date=Faker::Date.backward(14)
	order.order_number=Faker::Number.between(300,400)
	order.save
end
20.times do 
	line_item = LineItem.new
	line_item.order_id = Order.all.pluck(:id).sample
	line_item.product_id = Product.all.pluck(:id).sample
	line_item.quantity=Faker::Number.between(10,100)
	line_item.price=Faker::Number.number(3)
	line_item.save
end

200.times do 
	task = Task.new
	task.title = Faker::App.name
	task.project_id = Project.all.pluck(:id).sample
	#project = Project.order("RANDOM()").first   //it helps to pick an object automatically
	task.due_date=Faker::Date.between(Date.today,Date.today+2.months)
	task.is_completed=Faker::Boolean.boolean(0.2)
	task.save
end