class AddUserIdToDiaries < ActiveRecord::Migration[5.2]
  def up  
    execute 'DELETE FROM diaries;'
    add_reference :diaries, :user, foreign_key: true, null: false, index: true
  end

  def down
    remove_foreign_key :diaries, :users
    remove_reference :diaries, :user, index: true
  end
end
