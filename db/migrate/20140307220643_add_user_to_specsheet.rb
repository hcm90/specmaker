class AddUserToSpecsheet < ActiveRecord::Migration
  def change
    add_column :specsheets, :user_id, :integer
  end
end
