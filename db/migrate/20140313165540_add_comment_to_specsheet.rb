class AddCommentToSpecsheet < ActiveRecord::Migration
  def change
    add_column :specsheets, :comment, :text
  end
end
