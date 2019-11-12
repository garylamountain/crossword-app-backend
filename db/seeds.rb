# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'JSON'
require 'Faker'

dates = []
20.times do
    date = Faker::Date.between(from: Date.new(1979,01,01),to: Date.new(2014,12,31))
    if date.strftime("%A") != "Sunday"
        dates << date.strftime("%Y/%m/%d")
    end
end

dates.map do |date|
    puzzle = RestClient.get "https://raw.githubusercontent.com/doshea/nyt_crosswords/master/" + date + ".json"
    puzzle_array = JSON.parse(puzzle)
    Puzzle.create(gridLetters: puzzle_array["grid"], gridNumbers: puzzle_array["gridnums"], cluesAcross: puzzle_array["clues"]["across"], cluesDown: puzzle_array["clues"]["down"], answersAcross: puzzle_array["answers"]["across"], answersDown: puzzle_array["answers"]["down"])
end

# 8.times do 
#     Game.create(user: users.sample, puzzle: Puzzle.all.sample)
# end