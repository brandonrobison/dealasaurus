class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :short_description
      t.string :budget
      t.string :needed_by
      t.text :more_details
      t.integer :user_id

      t.timestamps
    end
	add_index :deals, [:user_id, :created_at]
  end
end
