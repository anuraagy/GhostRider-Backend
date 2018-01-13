class Api::V1::BaseController < ApplicationController
  before_action :authenticate_token?
  skip_before_action :verify_authenticity_token

  private

  def authenticate_token?
    user = User.find_by(:token => params[:token])
    
    if user.nil?
      render :json => { :message => "Invalid access token"}
    elsif user.token_expiry < Time.now
      render :json => { :message => "This is an expired token"}
    elsif !user.verified
      render :json => { :message => "User has not verified their email"}
    end
  end
end
