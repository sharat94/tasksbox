class RenameColumnsToProjects < ActiveRecord::Migration
  def change
  	remove_column :projects, :estimated_budget, :float
  	add_column :projects, :estimated_budget , :float
  end
end
