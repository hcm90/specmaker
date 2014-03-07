class Bowl < ActiveRecord::Base
belongs_to :specsheet
validates :left_right, :front_back, :depth, :bottom_grid, :colander, :specsheet_id, presence: true, on: :update


end
