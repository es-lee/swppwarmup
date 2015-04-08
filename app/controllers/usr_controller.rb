class UsrController < ApplicationController
  def main
  end

  def signup
    usr = User.new
    usr.username = params[:id]
    usr.password = params[:pw]
    usr.logincount = 1
    if usr.save
      render json: {
        user_name: usr.username,
        login_count: 1
      }
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
    usr = User.where(username: params[:id], password: params[:pw]).first()
    if usr
      usr.logincount += 1
      usr.save
      render json: {
        user_name: usr.username,
        login_count: usr.logincount
      }
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
