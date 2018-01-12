class Api::V1::AchievementsController < Api::V1::BaseController
  
  def index
    if params[:user_id] == nil
      render :json => Achievement.all
    else
      render :json => User.find(params[:user_id]).achievements
    end
  end

  def create
    user = User.find(params[:user_id])
    achievement_record = user.achievements_records.build(achievement_record_params)

    if achievement_record.save
      render :json => { :success => true }
    else
      render :json => { :success => false }
    end
  end

  private

  def achievement_record_params
    params.permit(:achievement_id)
  end
end
