class RemoveUserIdFromAnswers < ActiveRecord::Migration
  def up
  	remove_column :answers, :user_id
  end

  def down
  end
end
