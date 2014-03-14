class SpecsheetsController < ApplicationController
 #before_filter :load_bowls
	def index
		@specsheets = Specsheets.all
	end

	def show
		if !logged_in?
			session[:return_to_specsheet] = request.url
		end
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
		
		if @specsheet.update_attributes(specsheet_params)
			if current_user
				@specsheet.user_id = current_user.id
			end
			if params[:bowls].present? && @specsheet.bowls.count == 0
				number_of_bowls = params[:bowls].to_i
				@all_bowls = []
			 	number_of_bowls.times do 
 		 			@bowl = @specsheet.bowls.build
 		 			@bowl.save
 		 			@all_bowls << @bowl
 		 		end
 		 	# add an else statement before I crash again, boom!!! :-(
 		 	else
 	
 		 	end
 		 	respond_to do |format|
 		 		format.html { redirect_to specsheet_path(@specsheet) }
 		 		format.json { render json: { results: 
	 				@all_bowls.map do |b| 
	 					{
	 					url: specsheet_bowl_path(@specsheet, b), 
	 					id: b.id
	 					}
	 				end
	 			} }
 		 	end
		else
			respond_to do |format|
				format.html { redirect_to specsheet_path(@specsheet) }
				format.json { render json: { url: specsheet_bowl_path(@specsheet, @bowl) } }
			end
		end
	end

	def delete
		@specsheet = Specsheet.find(params[:id])
		@specsheet.destory
		redirect_to specsheets_path
	end

	private
	def specsheet_params
		params.require(:specsheet).permit(:name, :number_of_bowls, :installation, :corner_radius, :drain_location, :drain_size, :divider, :user_id)
	end

	# def load_bowls
	# 	@bowl = @specsheet.bowls.all
	# end

end
