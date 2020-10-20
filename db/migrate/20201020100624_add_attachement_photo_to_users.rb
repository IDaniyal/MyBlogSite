class AddAttachementPhotoToUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.attachment :photo
    end
  end
end
