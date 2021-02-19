require 'json'
require 'open-uri'

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drink_serialized = open(url).read
drinks = JSON.parse(drink_serialized)

puts 'Creating cocktails...'
cocktail = Cocktail.create!(name: 'Mojito')

drinks_list = drinks['drinks']

puts 'Generating Ingredient'

drinks_list.each do |drink|
  print '#'
  Ingredient.create!(name: drink['strIngredient1'])
end
puts '#'
puts 'Done!'
