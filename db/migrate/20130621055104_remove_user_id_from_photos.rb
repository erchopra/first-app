class RemoveUserIdFromPhotos < ActiveRecord::Migration
  def up
    remove_column :photos, :user_id
  end

  def down
  end
end
