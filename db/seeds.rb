# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TypeState.create(name: "No responde")
TypeState.create(name: "Asiste")
TypeState.create(name: "No asiste")

User.create(name: "Sebastian Orellana", email:"sebastian@gmail.com")
User.create(name: "Jhon Kazh", email:"jhonk@gmail.com")
User.create(name: "Felipe Rivas", email:"fpriz@gmail.com")
