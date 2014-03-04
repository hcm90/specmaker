class BowlsController < ApplicationController
 def new
 	@bowl = Bowl.new
 end

 def create
 	@bowl = Bowl.new(bowl_params)
 	if @bowl.save
			redirect_to bowl_url(@bowl) #WHERE SHOULD THIS REDIRECT?!
		else
			render :new
		end
	end
 end

 def edit
		@bowl = Bowl.find(params[:id])
	end

	def update
		@bowl = Bowl.find(params[:id])
		if @bowl.update_attributes(bowl_params)
			redirect_to bowl_path(@bowl)
		else
			render :edit
		end
	end

	def delete
		@bowl = Bowl.find(params[:id])
		@bowl.destory
		redirect_to bowls_path
	end

	private
	def bowl_params
		params.require(:bowl).permit(:left_right, :front_back, :depth, :bottom_grid, :colander, :specsheet_id)
	end
end
