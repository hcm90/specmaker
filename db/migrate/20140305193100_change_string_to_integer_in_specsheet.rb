class ChangeStringToIntegerInSpecsheet < ActiveRecord::Migration
  def change
 	change_column :specsheets, :bowl, :integer
  end
end
