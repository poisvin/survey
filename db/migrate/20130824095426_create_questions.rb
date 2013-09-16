class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :enquete_id
      t.text :content
      t.string :type

      t.timestamps
    end
  end
end
