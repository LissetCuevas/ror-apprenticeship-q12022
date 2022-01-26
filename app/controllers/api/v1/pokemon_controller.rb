class Api::V1::PokemonController < ApiController
  before_action :set_pokemon

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
