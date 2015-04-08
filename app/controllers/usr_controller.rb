class UsrController < ApplicationController
  def main
  end

  def signup
    id = params[:id]
    pw = params[:pw]

    render json: {
      user_name: id,
      login_count: 1
    }
  end
end
