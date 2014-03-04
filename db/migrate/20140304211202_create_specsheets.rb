class CreateSpecsheets < ActiveRecord::Migration
  def change
    create_table :specsheets do |t|
      t.string :name
      t.string :bowl
      t.string :installation
      t.string :corner_radius
      t.string :drain_location
      t.string :drain_size
      t.string :divider

      t.timestamps
    end
  end
end
