class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :avatar 
      t.references :user
      t.references :album
      t.timestamps
    end
  end
end
