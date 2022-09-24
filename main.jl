include("board.jl")
include("moves.jl")
import .board
import .moves

currentBoard = board.customBoard
#println("current board:")
board.printBoard(currentBoard)
#println("legal moves:")
#board.printBoardMarkings(knight.legalMoves(currentBoard, [1, 7]))
#println("attacked squares:")
#board.printBoardMarkings(knight.attackedSquares(currentBoard, [1, 7]))

board.printBoardMarkings(moves.attackedSquares(currentBoard, true))