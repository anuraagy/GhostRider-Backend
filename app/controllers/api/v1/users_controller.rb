class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :authenticate_token?

  def register
    user = User.new(user_params)
    user.token = SecureRandom.base58(24)

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
        render :json => { :success => true, :email => user.email, :token => user.token }
      else
        render :json => { :success => false, :message => "Invalid email or password submitted" }
      end
    else
      render :json => { :success => false, :message => "Invalid email or password submitted" }
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
