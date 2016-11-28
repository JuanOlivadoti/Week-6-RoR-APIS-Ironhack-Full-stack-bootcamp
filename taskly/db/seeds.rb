# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users = User.create([
# 	{name: 'Andrew Wiggin', email: 'ender@bs.if.com'},
# 	{name: 'Julian Delpiki', email: 'bean@if.com'}	
# 	])

tasks = Task.create([
	{name: 'User1 Task1', due_date: DateTime.now, user_id: User.first.id},
	{name: 'User1 Task2', due_date: DateTime.now, user_id: User.first.id},
	{name: 'User2 Task1', due_date: DateTime.now, user_id: User.last.id},
	])