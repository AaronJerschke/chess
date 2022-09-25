module pawn

function legalMoves(board, square)
    legalMoves = []
    if isuppercase(board[square[1], square[2]])
        if board[square[1] - 1, square[2]] == '.'
            append!(legalMoves, [[square[1] - 1, square[2]]])
            if board[square[1] - 2, square[2]] == '.' && square[1] == 7
                append!(legalMoves, [[square[1] - 2, square[2]]])
            end
        end
        if square[2] > 1
            if islowercase(board[square[1] - 1, square[2] - 1])
                append!(legalMoves, [[square[1] - 1, square[2] - 1]])
            end
        end
        if square[2] < 8
            if islowercase(board[square[1] - 1,square[2] + 1])
                append!(legalMoves, [[square[1] - 1, square[2] + 1]])
            end
        end
    else
        if board[square[1] + 1, square[2]] == '.'
            append!(legalMoves, [[square[1] + 1, square[2]]])
            if board[square[1] + 2, square[2]] == '.' && square[1] == 2
                append!(legalMoves, [[square[1] + 2, square[2]]])
            end
        end
        if square[2] > 1
            if isuppercase(board[square[1] + 1, square[2] - 1])
                append!(legalMoves, [[square[1] + 1, square[2] - 1]])
            end
        end
        if square[2] < 8
            if isuppercase(board[square[1] + 1, square[2] + 1])
                append!(legalMoves, [[square[1] + 1, square[2] + 1]])
            end
        end
    end
    
    return legalMoves
end

function attackedSquares(board, square)
    attackedSquares = []
    if board[square[1], square[2]] == 'P'
        if square[2] > 1
            append!(attackedSquares, [[square[1] - 1, square[2] - 1]])
        end
        if square[2] < 8
            append!(attackedSquares, [[square[1] - 1, square[2] + 1]])
        end
    elseif board[square[1], square[2]] == 'p'
        if square[2] > 1
            append!(attackedSquares, [[square[1] + 1, square[2] - 1]])
        end
        if square[2] < 8
            append!(attackedSquares, [[square[1] + 1, square[2] + 1]])
        end
    end
    return attackedSquares
end

end