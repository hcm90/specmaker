class CreateBowls < ActiveRecord::Migration
  def change
    create_table :bowls do |t|
      t.integer :left_right
      t.integer :front_back
      t.integer :depth

      t.timestamps
    end
  end
end
