class PuzzleSerializer < ActiveModel::Serializer
  attributes :id, :gridLetters, :gridNumbers, :cluesAcross, :cluesDown
end
