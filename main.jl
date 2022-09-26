include("board.jl")
include("moves.jl")

currentBoard = startBoard

gameOver = false
whiteToMove = true
while !gameOver
    println("Current board:")
    printBoard(currentBoard)

    if whiteToMove
        print("Please enter a move for white: ")
        move = interpretMoveNotation(currentBoard, readline(), true)
        safeMove!(currentBoard, move[1], move[2])
    else
        print("Please enter a move for black: ")
        move = interpretMoveNotation(currentBoard, readline(), false)
        safeMove!(currentBoard, move[1], move[2])
    end

    global whiteToMove = !whiteToMove
end

#moves.safeMove!(currentBoard, [7,5], [6,4])
#println("legal moves for piece on ", coordsToChessSquare([6, 5]), ":")
#printBoardMarkings(legalMoves(currentBoard, [6, 5]))
#println(isMate(currentBoard, false))