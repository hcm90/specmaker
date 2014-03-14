class BowlsController < ApplicationController
 before_filter :load_specsheet
 skip_before_action :verify_authenticity_token, only: [:update]

 def new
 	@bowl = Bowl.new
 end

 def show
 	@bowl = bowl.find(params[:id])
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

# def edit
# 	@bowl = Bowl.find(params[:bowls][0][:bowlId])
# end

	def update
		bowls = params[:bowls].map do |k,v|
			bowl = Bowl.find(v[:bowlId])
			bowl.left_right = v[:bowl][:left_right]
			bowl.front_back = v[:bowl][:front_back]
			bowl.depth = v[:bowl][:depth]
			bowl.bottom_grid = v[:bowl][:bottom_grid]
			bowl.colander = v[:bowl][:colander]
			bowl.save
		end
		respond_to do |format|
			format.json {render :json => { bowls: bowls }}
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
