class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
	  t.integer :user_id
      t.integer :deal_id

      t.timestamps
    end
	add_index :messages, [:deal_id, :created_at]
  end
end
