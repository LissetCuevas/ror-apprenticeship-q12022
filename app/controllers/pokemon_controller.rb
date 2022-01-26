class PokemonController < ApplicationController
  def index
    @pokemons = Pokemon.all
  end

  def show
    @pokemon = Pokemon.find_by_id(params[:id])
    @columns = Pokemon.column_names
  end

  def new
    @pokemon = Pokemon.new
    @types = Type.all
    @abilities = Ability.all
  end

  def create
    @types = Type.all
    @abilities = Ability.all
    @pokemon = Pokemon.new(pokemon_params)

    @pokemon.types << find_types_by_name(params[:pokemon][:types])
    @pokemon.abilities << find_abilities_by_name(params[:pokemon][:abilities])

    @pokemon.user_id = current_user.id

    if @pokemon.save
      redirect_to(pokemon_index_path)
    else
      flash[:error] = "Error creating pokemon, add it "
      render('new')
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    @pokemon = Pokemon.find(params[:id])

    if @pokemon.update(pokemon_params)
      redirect_to(pokemon_index_path)
    else
      render('edit')
    end
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    redirect_to(pokemon_index_path, status: 303)
  end

  def find_types_by_name(types)
    types_objects = []
    types.reject(&:empty?).each do |type_name|
      type = Type.find_by_name(type_name)
      types_objects.push(type)
    end
    types_objects
  end

  def find_abilities_by_name(abilities)
    abilities_objects = []
    abilities.reject(&:empty?).each do |ability_name|
      ability = Ability.find_by_name(ability_name)
      abilities_objects.push(ability)
    end
    abilities_objects
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :height, :order, :weight, :location_area_encounters)
  end
end
