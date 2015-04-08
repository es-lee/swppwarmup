class UsrController < ApplicationController
  def main
  end

  def signup
    usr = User.new
    usr.username = params[:id]
    usr.password = params[:pw]
    usr.logincount = 1
    usr.save

    render json: {
      user_name: usr.username,
      login_count: 1
    }
  end
end
