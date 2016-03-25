# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: 'joe', email: 'joe@joe.com', password: 'pw', description: 'I am a ruby ninja and OO disciple who likes red wine and ASP.net')
User.create(username: 'ryan', email: 'ryan@ryan.com', password: 'pw', description: 'I am a regular person with hobbies and stuff.')
User.create(username: 'peter', email: 'peter@peter.com', password: 'pw', description: 'I am Batman.')
