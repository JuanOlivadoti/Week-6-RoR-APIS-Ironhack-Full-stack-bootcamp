class Api::V1::TasksController < ApplicationController

	def index

		user = User.find_by(id: params[:user_id])

		unless user
			render json: { error: "User not found" }, status: 404
			return
		end

		tasks_pending = user.tasks.where(completed: false)
		tasks_completed = user.tasks.where(completed: true)

		render json: {completed: tasks_completed, pending: tasks_pending} #seteo cómo voy a devolver el json (devuelve un array de completed y otro de pending)
		
	end

	def create
		user = User.find_by(id: params[:user_id])

		unless user
			render json: { error: "User not found" }, status: 404
			return
		end

		task = user.tasks.create(task_params)

		render json: task
	end

	def show
		user = User.find_by(id: params[:user_id])

		unless user
			render json: { error: "User not found" }, status: 404
			return
		end

		task = user.tasks.find_by(id: params[:id]) #Busca sobre las tasks del usuario

		unless task
			render json: { error: "Task not found" }, status: 404
			return
		end

		render json: task

	end

	def destroy
		user = User.find_by(id: params[:user_id])

		unless user
			render json: { error: "User not found" }, status: 404
			return
		end

		task = User.tasks.find_by(id: params[:id]) #Busca sobre las tasks del usuario

		unless task
			render json: { error: "Task not found" }, status: 404
			return
		end

		task.destroy
		render json: task		
	
	end

	def complete
		user = User.find_by(id: params[:user_id])

		unless user
			render json: { error: "User not found" }, status: 404
			return
		end

		task = user.tasks.find_by(id: params[:id]) #Busca sobre las tasks del usuario

		unless task
			render json: { error: "Task not found" }, status: 404
			return
		end

		task.complete
		render json: task		
		
	end

	private

	def task_params
		params.require(:task).permit(:name, :due_date) #, :user_id no puedo meter esto ahí porque ya lo tengo en la url		
	end


end
