class UsersController < ApplicationController

    def index
        users = User.all
        render json: users.to_json
    end

    def show
        user = User.find_by(id: params[:id])
        render json: user.to_json
    end

    def create
        user = User.create(username: params[:username], password: params[:password], score: 0)
        render json: user.to_json
    end

end
