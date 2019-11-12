class GamesController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        puzzle = Puzzle.find(params[:puzzle])
        game = Game.create(user: user, puzzle: puzzle)
        render json: game.to_json

    end

end
