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
        user = User.find_by(username: params[:username])
        payload = { id: user.id}
    
        token = JWT.encode payload, 'secret', 'HS256'
    
        if user
          render json: { id: user.id, username: user.username, token: token }
        else
          render json: { error: 'invalid credentials' }, status: 401
        end
    end

end
