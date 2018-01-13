class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate_token?, :only => [:register, :authenticate, :verify_email]
  before_action :verify_user, :only => [:feed, :add_friend, :remove_friend, :like_post, :unlike_post]

  def register
    user = User.new(user_params)

    user.token = SecureRandom.urlsafe_base64(24)
    user.token_expiry = Time.now + 30.days

    user.verification_token = rand(99999)
    user.verified = false

    if user.save
      send_verification_email(user)
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
        if user.verified
          user.token = SecureRandom.urlsafe_base64(24)
          user.token_expiry = Time.now + 30.days
          user.save

          render :json => { :success => true, :email => user.email, :token => user.token }
        else
          render :json => { :success => false, :message => "The user has not verified their email" }
        end
      else
        render :json => { :success => false, :message => "Invalid email or password submitted" }
      end
    else
      render :json => { :success => false, :message => "Invalid email or password submitted" }
    end
  end

  def verify_email
    user = User.find(params[:id])

    if user.verification_token == params[:verification_token].to_i
      user.verified = true
      user.save
      render :json => { :success => true, :message => "The user has been successfully verified"}
    else 
      render :json => { :success => false, :message => "Invalid verification token" }
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

  def verify_user
    user = User.find(params[:id])

    if user.token != params[:token]
      render :json => { :success => false, :message => "You do not have access to this data" }
    end
  end

  def send_verification_email(user)
    mg_client = Mailgun::Client.new(Settings.mailgun_api_key)

    message_params =  { from: 'Anuraag <anuraag@dchacks.org>',
                        to:   user.email,
                        subject: 'The Ruby SDK is awesome!',
                        text:    "Here is your verification code: #{user.verification_token}"
                      }

    # Send your message through the client
    mg_client.send_message 'dchacks.org', message_params
  end
end
