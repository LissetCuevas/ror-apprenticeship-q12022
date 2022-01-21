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
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to(pokemon_index_path)
    else
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

  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :base_experience, :height, :order, :weight, :location_area_encounters)
  end
end
