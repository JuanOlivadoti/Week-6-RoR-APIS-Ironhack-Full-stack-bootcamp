class Api::V1::TasksController < ApplicationController

		def show
		user = User.find_by(id: params[:user_id])
		task = Task.find_by(id: params[:id])

		unless task && user
			render json: { error: "Task not found" }, status: 404
			return
		end
		render json: task		
	end

	private

	def user_params
		params.require(:task).permit(:name, :due_date, :user_id)		
	end


end
