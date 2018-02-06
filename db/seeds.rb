# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

reshel = Project.create( name: "Reshel" ) 
lawyers = Project.create( name: "Lawyers" )

Todo.create( name: "Administration", project: reshel)
Todo.create( name: "Business", project: reshel)
Todo.create( name: "Dev", project: reshel)

Todo.create( name: "Admin", project: lawyers)
Todo.create( name: "Dev", project: lawyers)
