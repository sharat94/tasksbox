class AddCodeToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees , :code, :string
  	add_column :employees , :department_id, :integer
  	add_column :departments,  :name ,:string
  end
end
