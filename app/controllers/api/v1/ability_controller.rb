class Api::V1::AbilityController < ApiController
  def index
    if params[:search].blank?
      @abilities = Ability.all
    else
      @abilities = Ability.where('name LIKE ?', "%#{params[:search]}%").to_a
    end
    render json: @abilities.to_json
  end

  def show
    @ability = Ability.find(params[:id])
    render json: @ability.to_json
  end
end
