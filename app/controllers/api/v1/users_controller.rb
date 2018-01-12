class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate_token?, :only => [:register, :authenticate]

  def register
    user = User.new(user_params)
    user.token = SecureRandom.urlsafe_bas64(24)
    user.token_expiry = Time.now + 30.days

    if user.save
      render :json => { :success => true, :message => user.as_json }
    else
      render :json => { :success => false, :message => user.errors.as_json }
    end
  end

  def authenticate
    email = params[:email]
    password = params[:password]

    user = User.find_by_email(params[:email])

    if !user.nil?
      if user.valid_password?(password)
        if user.token_expiry < Time.now
          user.token = SecureRandom.urlsafe_base64(24)
          user.token_expiry = Time.now + 30.days
          user.save
        end
        render :json => { :success => true, :email => user.email, :token => user.token }
      else
        render :json => { :success => false, :message => "Invalid email or password submitted" }
      end
    else
      render :json => { :success => false, :message => "Invalid email or password submitted" }
    end
  end

  def add_friend
    relationship = Relationship.new(:user_id => params[:id], :friend_id => params[:friend_id])

    if relationship.save
      render :json => { :success => true }
    else
      render :json => { :success => false }
    end
  end

  def remove_friend
    relationship = Relationship.find_by(:user_id => params[:id], :friend_id => params[:friend_id])
    relationship.destroy
    
    render :json => { :success => true }
  end

  def friends
    user = User.find(params[:id])

    render :json => user.friends.select(:id, :name).as_json
  end

  def followers
    user = User.find(params[:id])

    render :json => user.followers.select(:id, :name).as_json
  end

  def feed
    user = User.find(params[:id])

    render :json => user.friends_posts.order('created_at ASC').as_json
  end

  def like_post
    post = Post.find(params[:post_id])
    post.likes += 1

    if post.save
      render :json => { :success => true }
    else
      render :json => { :success => false } 
    end
  end

  def unlike_post
    post = Post.find(params[:post_id])
    post.likes -= 1

    if post.save
      render :json => { :success => true }
    else
      render :json => { :success => false } 
    end  
  end

  private
  def user_params
    params.permit(:name, :email, :password, :age, :weight, :height )
  end

  def user_sign_in_params
    params.permit(:email, :password)
  end
end
