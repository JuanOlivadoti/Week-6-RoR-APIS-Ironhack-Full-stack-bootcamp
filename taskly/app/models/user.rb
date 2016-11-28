class User < ApplicationRecord
	has_many :tasks

	def as_json(options={})
		super(only: [:name, :email],
			methods: [:tasks_count, :holi], #Le paso el nombre de un método y el lo ejecuta.
			include: [tasks: { only: :name}] #Devuelvo las tasks del usuario pero ONLY su nombre. Nested only & methods.
			)
	end

	def tasks_count
		self.tasks.count	
	end

	def holi
		"hola holita"
	end
end
