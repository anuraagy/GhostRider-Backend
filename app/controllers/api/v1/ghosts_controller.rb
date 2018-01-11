class Api::V1::GhostsController < Api::V1::BaseController
  
  def index
    ghosts = Ghost.where(ghost_params)
    render :json => ghosts.as_json
  end

  def search
    ghosts = Ghost.fuzzy_search(search_params)
    render :json => ghosts.as_json
  end

  def create
    ghost = Ghost.new(ghost_params)

    if ghost.save
      render :json => ghost.as_json
    else
      render :json => ghost.errors.as_json
    end
  end

  def update
    ghost = Ghost.find(params[:id])

    if ghost.update(ghost_params)
      render :json => ghost.as_json
    else
      render :json => ghost.errors.as_json
    end
  end

  def destroy
    ghost = Ghost.find(params[:id])

    if ghost.user.token == params[:token] && ghost.destroy
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end
  end

  private

  def ghost_params
    params.permit(:id, :name, :distance, :data, :status, :time, :calories_burned, :user_id, :event_id)
  end

  def search_params
    params.permit(:query)
  end
end
