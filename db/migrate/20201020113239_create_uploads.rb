class CreateUploads < ActiveRecord::Migration[5.1]
  def change
    create_table :uploads do |t|
      t.attachment :photo
      t.references :blog, foreign_key: true
      t.timestamps
    end
  end
end
