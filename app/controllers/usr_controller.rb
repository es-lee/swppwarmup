class UsrController < ApplicationController
  def main
  end

  def signup
    render plain: 'ajax 요청 보내기 성공'
  end
end
