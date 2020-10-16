class AddApprovedToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :is_approved, :boolean, :null => false, :default => false
  end
end
