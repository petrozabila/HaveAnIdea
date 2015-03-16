# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name:'Ivan', email:'111@mail.ru', password:'qwerty', id:1)
User.create(name:'Sanek', email:'123@mail.ru', password:'qwerty', id:2)

Idea.create(name:'Nice idea', description:'Nice idea', user_id:1 )
Idea.create(name:'Damned awesome idea', description:'Likewise I said damned awesome idea bro', user_id:2 )
Friendship.create(user_id:1, friend_id:2)


