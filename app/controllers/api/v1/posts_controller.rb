class Api::V1::PostsController < Api::V1::BaseController
  before_action :verify_user
  
  def index
    user = User.find(params[:user_id])

    render :json => user.posts.as_json
  end

  def create
    user = User.find(params[:user_id])
    post = user.posts.build(post_params)

    if post.save
      render :json => { :success => true }
    else
      render :json => { :success => false }
    end
  end

  private

  def post_params
    params.permit(:title, :description, :image_url, :postable_id, :postable_type)
  end

  def verify_user
    user = User.find(params[:user_id])

    if user.token != params[:token]
      render :json => { :success => false, :message => "You do not have access to this data" }
    end
  end
end
