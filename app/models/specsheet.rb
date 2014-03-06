class Specsheet < ActiveRecord::Base
has_many :bowls
accepts_nested_attributes_for :bowls

def specsheet_params
 	params.require(:specsheet).permit(:name, :number_of_bowls, :installation, :corner_radius, :drain_location, :drain_size, :divider, bowls_attributes: [:left_right, :front_back, :depth, :bottom_grid, :colander, :specsheet_id])
end
end
