include("moves.jl")

currentBoard = copy(customBoard2)
enPassantBoard = copy(emptyBoard)

whiteToMove = false
rightToCastle = [true true]

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

    moveChess = String(readline())

    move = interpretMoveNotation(currentBoard, moveChess, whiteToMove)
    if length(move) == 2
        if safeMove!(currentBoard, move[1], move[2], enPassantBoard, rightToCastle) == 0
            if !isnothing(match(r"=[QRBN]$", moveChess))
                if currentBoard[move[2][1], move[2][2]] == 'P' && move[2][1] == 1
                    promotePawn!(currentBoard, move[2], moveChess[end])
                elseif currentBoard[move[2][1], move[2][2]] == 'p' && move[2][1] == 8
                    promotePawn!(currentBoard, move[2], moveChess[end])
                end
            end
            global whiteToMove = !whiteToMove
        end
    end
end