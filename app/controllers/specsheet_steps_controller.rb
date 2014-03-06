class SpecsheetStepsController < ApplicationController
include Wicked::Wizard
steps :step2, :step3

def show
	@specsheet = Specsheet.find(params[:specsheet_id])
	render_wizard 
end

def update
	@specsheet = Specsheet.find(params[:specsheet_id])
	@specsheet.update_attributes(specsheet_params)

	render_wizard @specsheet
end


private

def finish_wizard_path
  specsheet_path(@specsheet)
end

def specsheet_params
 	params.require(:specsheet).permit(:name, :number_of_bowls, :installation, :corner_radius, :drain_location, :drain_size, :divider, bowls_attributes: [:left_right, :front_back, :depth, :bottom_grid, :colander, :specsheet_id])
end

end
