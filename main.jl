include("moves.jl")

currentBoard = copy(customBoard2)
enPassantBoard = copy(emptyBoard)

whiteToMove = true
while true
    println("Current board:")
    printBoard(currentBoard)
    
    if whiteToMove && isMate(currentBoard, true)
        print("Black wins by checkmate.")
        break
    elseif !whiteToMove && isMate(currentBoard, false)
        print("White wins by checkmate.")
        break
    end

    if whiteToMove
        print("Please enter a move for white: ")
    else
        print("Please enter a move for black: ")
    end

    move = interpretMoveNotation(currentBoard, String(readline()), whiteToMove)
    if length(move) == 1
        if safeMove!(currentBoard, move[1], move[2], enPassantBoard) == 0
            global whiteToMove = !whiteToMove
        end
    end
end