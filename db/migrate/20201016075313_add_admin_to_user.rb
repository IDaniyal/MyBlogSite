class AddAdminToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :superadmin, :boolean, :null => false, :default => false

    User.create! do |r|
      r.email      = 'default@example.com'
      r.password   = 'password'
      r.superadmin = true
    end
  end
end
