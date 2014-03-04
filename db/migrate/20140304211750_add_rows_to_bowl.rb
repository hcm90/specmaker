class AddRowsToBowl < ActiveRecord::Migration
  def change
    add_column :bowls, :bottom_grid, :boolean
    add_column :bowls, :colander, :boolean
    add_column :bowls, :specsheet_id, :integer
  end
end
