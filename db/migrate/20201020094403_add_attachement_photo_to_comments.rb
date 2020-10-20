class AddAttachementPhotoToComments < ActiveRecord::Migration[5.1]
  def change
    change_table :comments do |t|
      t.attachment :photo
    end
  end
end
