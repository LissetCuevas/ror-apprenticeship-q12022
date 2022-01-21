# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
require 'poke-api-v2'

# Fill database with pokeapi data
(1..150).each do |i|
  res = PokeApi.get(pokemon: i)
  Pokemon.create(
    name: res.name,
    base_experience: res.base_experience,
    height: res.height,
    is_default: res.is_default,
    order: res.order,
    weight: res.weight,
    location_area_encounters: res.location_area_encounters,
    api_id: res.id
  )
end
