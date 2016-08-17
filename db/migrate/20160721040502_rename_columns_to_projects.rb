class RenameColumnsToProjects < ActiveRecord::Migration
  def change
  	rename_column :projects, :float , :estimated_budget
  	change_column :projects, :estimated_budget , :float
  end
end
