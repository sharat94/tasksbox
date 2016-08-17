class ProdsController < ApplicationController
  def items
  	@items=Product.includes(:project_category)

  end

def items_asc
	@items_asc=Product.order("price")
end

def items_dsc
	@items_dsc=Product.order("price DESC")
end
def items_stock
	@items_stock=Product.where('in_stock = ?',true)
end
def items_unavailable
	@items_unavailable=Product.where('available_from >?',Date.today)
end
def items_stockout
	@items_stockout=Product.where('in_stock = ?',false)
end
def items_totalprice
	@items_totalprice=Product.all
end
def items_stockprice
	@items_stockprice=Product.all
end
def category
	@category=Category.all
end
def orders
	@orders=Order.all
end
def line_item
	@line_item=LineItem.all
end
end
