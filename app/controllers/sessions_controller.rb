# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    create_user

    session[:user_id] = @user.id

    render "welcome/home"
  end

private

  def auth
    request.env["omniauth.auth"]
  end

  def create_user
    @user = User.find_or_create_by(uid: auth["uid"]) do |u|
      u.name = auth["info"]["name"]
      u.email = auth["info"]["email"]
      u.image = auth["info"]["image"]
    end
  end
end
