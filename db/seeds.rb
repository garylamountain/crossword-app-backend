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

users = []
3.times do 
    user = User.create(username: Faker::Internet.username);
    users << user
end

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
    Puzzle.create(grid: puzzle_array["grid"],gridnums: puzzle_array["gridnums"], cluesAcross: puzzle_array["clues"]["across"],cluesDown: puzzle_array["clues"]["down"],answersAcross: puzzle_array["answers"]["across"],answersDown: puzzle_array["answers"]["down"])
end

# 8.times do 
#     Game.create(user: users.sample, puzzle: Puzzle.all.sample)
# end

# const gridwords = [];
# let across = 0;
# let down = 0;
# const findLetter = (id) => gridwords.find(grid => grid.id === id)
# while(let i=0; i < grid.length; i++) {
#     if(gridnums[i] > 0 && grid[i] !== '.' && grid[i+15] !== '.' && (i+14) < 225) {
#       gridwords.push({
#         id: i,
#         letter: grid[i],
#         number: gridnums[i],
#         across: true,
#         clue_across: across,
#         clue_down: null,
#         down: null
#       })
#       if(i == 14) across = across + 1
#     } else if(grid[i] !== '.' && grid[i+15] !== '.' && (i+15) < 225) {
#       gridwords.push({
#         id: i,
#         letter: grid[i],
#         clue_across: across,
#         clue_down: null,
#         across: true,
#         down: null
#       })
#       if(i == 14) across = across + 1
#     } else if(gridnums[i] > 0 && grid[i] !== '.') {
#       gridwords.push({
#         id: i,
#         letter: grid[i],
#         number: gridnums[i],
#         across: true,
#         clue_across: across,
#         clue_down: null,
#         down: null
#       })
#       if(i == 14) across = across + 1
#     } else if(grid[i] !== '.') {
#       gridwords.push({
#         id: i,
#         letter: grid[i],
#         clue_across: across,
#         clue_down: 0,
#         across: true,
#         down: null
#       })
#       if(i == 14) across = across + 1
#     } else {
#       across = across + 1
#       gridwords.push({
#         id: i,
#         letter: null
#       })
#     }
# }


# for(let i=0; i < grid.length; i++) {
#   if(gridnums[i] > 0 && grid[i] !== '.' && grid[i+15] !== '.' && i < 15){
#     findLetter(i).down = true
#     findLetter(i).clue_down = down
#     down = down + 1
#   } else if(grid[i] !== '.' && (i-15) >= 0 && grid[i-15] !== '.' && findLetter(i-15).down === true) {
#     findLetter(i).down = true
#     findLetter(i).clue_down = findLetter(i-15).clue_down
#   } else if(gridnums[i] > 0 && grid[i] !== '.' && (i-15) >= 0 && grid[i-15] === '.') {
#     findLetter(i).down = true
#     down = down + 1
#     findLetter(i).clue_down = down
#   }
# }