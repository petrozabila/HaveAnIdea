# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name:'Ivan', email:'111@mail.ru', password:'qwerty', id:1)

Idea.create(name:'Nice idea', description:'Nice idea', user_id:1 )
