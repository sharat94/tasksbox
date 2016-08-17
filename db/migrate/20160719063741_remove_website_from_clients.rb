class RemoveWebsiteFromClients < ActiveRecord::Migration
  def change
  	remove_column :clients , :website
  end
end
