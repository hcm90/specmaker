class SpecsheetsController < ApplicationController
 #before_filter :load_bowls
	def index
		@specsheets = Specsheets.all
	end

	def show
		@specsheet = Specsheet.find(params[:id])
		@bowl = @specsheet.bowls.all
	end

	def new
		@specsheet = Specsheet.new
	end

	def create
		@specsheet = Specsheet.new(specsheet_params)
		#number_of_bowls = params[:bowls].to_i
		if @specsheet.save
			# number_of_bowls.times do 
	 	# 		@bowl = @specsheet.bowls.build
	 	# 		@bowl.save
	 	# 		@bowl.specsheet_id = @specsheet.id
	 	#	end
			redirect_to edit_specsheet_path(@specsheet)
		else
			render :new
		end
	end

	def edit
		@specsheet = Specsheet.find(params[:id])
		@bowls = @specsheet.bowls.all
	end

	def update
		@specsheet = Specsheet.find(params[:id])
		@bowl = @specsheet.bowls.all
		if params[:bowls].present? && @specsheet.bowls.count == 0
			number_of_bowls = params[:bowls].to_i
			 number_of_bowls.times do 
 		 			@bowl = @specsheet.bowls.build
 		 			@bowl.save
 		 			@bowl.specsheet_id = @specsheet.id
 		 	end
 		 end
		respond_to do |format|
		if @specsheet.update_attributes(specsheet_params)

			redirect_to edit_specsheet_path(@specsheet)
		else
			format.html {redirect_to edit_specsheet_path(@specsheet)}
			format.js {}
		end
		format.json { render json: @specsheet.bowls }
		format.js {}
		format.html {redirect_to edit_specsheet_path(@specsheet)}
	end
	end

	def delete
		@specsheet = Specsheet.find(params[:id])
		@specsheet.destory
		redirect_to specsheets_path
	end

	private
	def specsheet_params
		params.require(:specsheet).permit(:name, :number_of_bowls, :installation, :corner_radius, :drain_location, :drain_size, :divider)
	end

	# def load_bowls
	# 	@bowl = @specsheet.bowls.all
	# end

end
