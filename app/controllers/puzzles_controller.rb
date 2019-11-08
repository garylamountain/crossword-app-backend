class PuzzlesController < ApplicationController

    def index
        puzzles = Puzzle.all
        render json: puzzles.to_json
    end

    def show
        puzzle = Puzzle.find_by(id: params[:id])
        render json: puzzle.to_json
    end

end
