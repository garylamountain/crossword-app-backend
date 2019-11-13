class GamesController < ApplicationController

    def index
        games = Game.all
        render json: games
    end

    def show
        game = Game.find_by(id: params[:id])
        render json: game
    end

    def create
        user = User.find_by(username: params[:username])
        puzzle = Puzzle.find(params[:puzzle])
        game = Game.find_or_create_by(user: user, puzzle: puzzle)
        render json: game.to_json
    end

end
