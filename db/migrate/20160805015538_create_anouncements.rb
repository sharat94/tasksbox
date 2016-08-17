class CreateAnouncements < ActiveRecord::Migration
  def change
    create_table :anouncements do |t|
      t.string :title
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
