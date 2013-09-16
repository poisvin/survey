class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :user
      t.references :enquete

      t.timestamps
    end
    add_index :responses, :user_id
    add_index :responses, :enquete_id
  end
end
