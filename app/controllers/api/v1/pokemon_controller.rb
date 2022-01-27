class Api::V1::PokemonController < ApiController
  before_action :set_pokemon, only: [:show]

  def index
    if params[:search].blank?
      @pokemons = Pokemon.all
    else
      @pokemons = Pokemon.where('name LIKE ?', "%#{params[:search]}%").to_a
    end
    render json: @pokemons.to_json
  end

  def show
    if @pokemon.public
      render json: @pokemon.to_json
    else
      render json: {
        error: 'private pokemon'
      }
    end
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
