class BowlsController < ApplicationController
 before_filter :load_specsheet

 def new
 	@bowl = Bowl.new
 end

 def create
	if params[:bowls].present? && @specsheet.bowls.count == 0
		number_of_bowls = params[:bowls].to_i
		number_of_bowls.times do 
 			@bowl = @specsheet.bowls.build
 			@bowl.save
 			@bowl.specsheet_id = @specsheet.id
 			redirect_to edit_specsheet_path(@specsheet)
 		end
 	else
 		render :new
 	end
 end

	def edit
		@bowl = Bowl.find(params[:id])
	end

	def update
		@bowl = Bowl.find(params[:id])
		if @bowl.update_attributes(bowl_params)
			redirect_to edit_specsheet_path(@specsheet)
		else
			render :edit
		end
	end

	def delete
		@bowl = Bowl.find(params[:id])
		@bowl.destroy
		redirect_to bowls_path
	end

	private
	def bowl_params
		params.require(:bowl).permit(:id, :left_right, :front_back, :depth, :bottom_grid, :colander, :specsheet_id)
	end

	def load_specsheet
		@specsheet = Specsheet.find(params[:specsheet_id])
	end
end
