class ChangeColumnDefaultValueInSpecsheetsAgainn < ActiveRecord::Migration
  def change
  	change_column :specsheets, :status, :string, { default: 'new' }
  end
end
