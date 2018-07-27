# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    make_user
    session[:user_id] = @user.id
    render "welcome/home"
  end

private

  def make_user
    @user = User.find_or_create_by(uid: auth["uid"]) do |u|
      u.name = auth["info"]["name"]
      u.email = auth["info"]["email"]
      u.image = auth["info"]["image"]
    end
  end

  def auth
    request.env["omniauth.auth"]
  end
end
