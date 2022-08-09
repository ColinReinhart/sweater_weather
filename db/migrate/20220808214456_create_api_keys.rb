class CreateApiKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :api_keys do |t|
      t.integer :bearer_id, null: false
      t.string :bearer_type, null: false
      t.string :token, null: false

      t.timestamps null:false
    end
  end
end
