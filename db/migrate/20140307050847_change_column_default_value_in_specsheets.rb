class ChangeColumnDefaultValueInSpecsheets < ActiveRecord::Migration
  def change
  	change_column :specsheets, :status, :integer, default: 'new'
  end
end
