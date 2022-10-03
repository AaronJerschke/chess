include("moves.jl")

currentBoard = copy(startBoard)
enPassantBoard = copy(emptyBoard)

whiteToMove = false
rightToCastle = [true true]

while true
    printBoard(currentBoard)
    
    if whiteToMove
        if isMate(currentBoard, true, enPassantBoard)
            println("Black wins by checkmate.")
            break
        elseif isStaleMate(currentBoard, true, enPassantBoard)
            println("Stalemate")
            break
        end
    elseif !whiteToMove
        if isMate(currentBoard, false, enPassantBoard)
            println("White wins by checkmate.")
            break
        elseif isStaleMate(currentBoard, false, enPassantBoard)
            println("Stalemate")
            break
        end
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