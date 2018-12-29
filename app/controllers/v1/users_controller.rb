# frozen_string_literal: true

module V1
  # Comment
  class UsersController < ApplicationController

    def index
      @users = User.all
      render json: {message: "success", data: {users: @users}}, status: :ok
    end

    def show
      @user = User.find_by(id: params[:id])
      render json: {message: "success", data: {user:@user.as_json(include: :products)}}, status: :ok

    end

    def create
      @user = User.new(user_params)
      if @user.save
        render :create, status: :created
      else
        head(:unprocessable_entity)
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end