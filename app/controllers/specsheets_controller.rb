class SpecsheetsController < ApplicationController
	def index
		@specsheets = Specsheets.all
	end

	def show
		@specsheet = Specsheet.find(params[:id])
	end

	def new
		@specsheet = Specsheet.new
	end

	def create
		@specsheet = Specsheet.new(specsheet_params)
		if @specsheet.save
			@specsheet.number_of_bowls.times do |bowl|
	 		@bowl = @specsheet.bowls.build
	 		@bowl.save
	 		#@bowl = Bowl.new
	 		@bowl.specsheet_id = @specsheet.id
	 	end
			redirect_to specsheet_specsheet_steps_path(@specsheet)#new_specsheet_bowl_path(@specsheet)
		else
			render :new
		end
	end

	def edit
		@specsheet = Specsheet.find(params[:id])
	end

	def update
		@specsheet = Specsheet.find(params[:id])
		if @specsheet.update_attributes(specsheet_params)
			redirect_to wizard_path(:step3)#(@specsheet)
		else
			render :edit
		end
	end

	def delete
		@specsheet = Specsheet.find(params[:id])
		@specsheet.destory
		redirect_to specsheets_path
	end

	private
	def specsheet_params
		params.require(:specsheet).permit(:name, :number_of_bowls, :installation, :corner_radius, :drain_location, :drain_size, :divider, bowls_attributes: [:id, :left_right, :front_back, :depth, :bottom_grid, :colander, :specsheet_id])
	end

end
