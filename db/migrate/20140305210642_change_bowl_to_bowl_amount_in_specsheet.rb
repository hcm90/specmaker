class ChangeBowlToBowlAmountInSpecsheet < ActiveRecord::Migration
  def change
  	rename_column :specsheets, :bowl, :number_of_bowls
  end
end
