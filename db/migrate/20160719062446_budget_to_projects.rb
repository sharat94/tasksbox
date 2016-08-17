class BudgetToProjects < ActiveRecord::Migration
  def change
  	#add_column :table_name, :column_name, :column_type
  	add_column :projects , :budget , :integer
  	#add_column :Client , :id ,:integer
  end
end
