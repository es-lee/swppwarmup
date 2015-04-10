class UsrController < ApplicationController
  skip_before_filter :verity_authenticity_token
  def main
  end

  def signup
	puts params
    usr = User.new
    usr.username = params[:username]
    usr.password = params[:password]
    usr.logincount = 1
    if usr.save
      render json: {
        user_name: usr.username,
        login_count: 1
      }, status: 200
    else
      msg = usr.errors.messages
      if msg[:username] && (msg[:username] != ["has already been taken"])
        render json: {
          error_code: -1
        }, status: 412
      elsif usr.errors.messages[:password]
        render json: {
          error_code: -2
        }, status: 412
      elsif msg[:username] && (msg[:username] == ["has already been taken"])
        render json: {
          error_code: -3
        }, status: 412
      else
        render json: {
          error_code: -5
        }, status: 412
      end
    end
  end

  def login
    usr = User.where(username: params[:username], password: params[:password]).first()
    if usr
      usr.logincount += 1
      usr.save
      render json: {
        user_name: usr.username,
        login_count: usr.logincount
      }, status: 200
    else
      render json: {
        error_code: -4
      }, status: 412
    end
  end

  def clear
    User.delete_all
    head :ok
  end
end
