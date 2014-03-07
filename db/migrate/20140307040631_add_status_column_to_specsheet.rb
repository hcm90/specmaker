class AddStatusColumnToSpecsheet < ActiveRecord::Migration
  def change
  	add_column :specsheets, :status, :string
  end
end
