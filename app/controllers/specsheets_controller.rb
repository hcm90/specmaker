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
			redirect_to specsheet_url(@specsheet)
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
			redirect_to specsheet_path(@specsheet)
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
		params.require(:specsheet).permit(:name, :bowl, :installation, :corner_radius, :drain_location, :drain_size, :divider)
	end

end
