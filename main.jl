include("board.jl")
include("moves.jl")

currentBoard = customBoard2
println("current board:")
printBoard(currentBoard)
#println("legal moves:")
#board.printBoardMarkings(queen.legalMoves(currentBoard, [4, 8]))
#println("attacked squares:")
#board.printBoardMarkings(knight.attackedSquares(currentBoard, [1, 7]))

#board.printBoardMarkings(moves.attackedSquares(currentBoard, false))

#println(moves.isChecked(currentBoard, false))

#moves.safeMove!(currentBoard, [7,5], [6,4])
println("legal moves for piece on ", coordsToChess([6, 5]), ":")
printBoardMarkings(legalMoves(currentBoard, [6, 5]))
#printBoard(currentBoard)