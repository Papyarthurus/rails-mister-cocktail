# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'pry'

puts 'Cleaning database...'
Ingredient.destroy_all

puts 'Creating restaurants...'
# Parsing JSON
filepath    = Rails.root.to_s + '/db/data/ingredients.json'

serialized_ingredients = File.read(filepath) # We get a string

ingredients = JSON.parse(serialized_ingredients)
# binding.pry


ingredients['drinks'].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

puts 'Finished!'


