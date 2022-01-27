class Api::V1::TypeController < ApiController
  def index
    if params[:search].blank?
      @types = Type.all
    else
      @types = Type.where('name LIKE ?', "%#{params[:search]}%").to_a
    end
    render json: @types.to_json
  end

  def show
    @type = Type.find(params[:id])
    render json: @type.to_json
  end
end
