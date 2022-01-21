# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Fill Abilities table with pokeapi data
(1..247).each do |i|
  unless Ability.find_by_api_id(i)
    ability = PokeApi.get(ability: i)
    effects = ability.effect_entries
    puts "Ability #{i}"
    Ability.create(
      name: ability.name,
      generation: ability.generation.name,
      effect: effects.empty? ? '' : effects[0].effect.present,
      short_effect: effects.empty? ? '' : effects[0].short_effect.present,
      api_id: ability.id
    )
  end
end

# Fill Types table with pokeapi data
(1..18).each do |i|
  unless Type.find_by_id(i)
    puts "Type #{i}"
    type = PokeApi.get(type: i)
    Type.create(
      name: type.name,
      generation: type.generation.name
    )
  end
end

# Fill Pokemons table with pokeapi data
(1..40).each do |i|
  unless Pokemon.find_by_api_id(i)
    puts "Pokemon #{i}"
    pokemon = PokeApi.get(pokemon: i)
    new_pokemon = Pokemon.create(
      name: pokemon.name,
      base_experience: pokemon.base_experience,
      height: pokemon.height,
      is_default: pokemon.is_default,
      order: pokemon.order,
      weight: pokemon.weight,
      location_area_encounters: pokemon.location_area_encounters,
      api_id: pokemon.id
    )
    pokemon.abilities.each do |ability_obj|
      ability = Ability.find_by_name(ability_obj.ability.name)
      new_pokemon.abilities << ability
    end
  end
end
