module knight

function legalMoves(board, square)
    #all attacked squares that are not occupied by a friendly piece
    legalMoves = []
    
    isWhite = isuppercase(board[square[1], square[2]])

    for move in attackedSquares(board, square)
        if isuppercase(board[move[1], move[2]]) != isWhite || board[move[1], move[2]] == '.'
            append!(legalMoves, [move])
        end
    end

    return legalMoves
end

function attackedSquares(board, square)
    attackedSquares = []
    if square[1] < 7
        if square[2] > 1
            append!(attackedSquares, [[square[1] + 2, square[2] - 1]])
        end
        if square[2] < 8
            append!(attackedSquares, [[square[1] + 2, square[2] + 1]])
        end
    end
    if square[2] < 7
        if square[1] > 1
            append!(attackedSquares, [[square[1] - 1, square[2] + 2]])
        end
        if square[1] < 8
            append!(attackedSquares, [[square[1] + 1, square[2] + 2]])
        end
    end
    if square[2] > 2
        if square[1] > 1
            append!(attackedSquares, [[square[1] - 1, square[2] - 2]])
        end
        if square[1] < 8
            append!(attackedSquares, [[square[1] + 1, square[2] - 2]])
        end
    end
    if square[1] > 2
        if square[2] > 1
            append!(attackedSquares, [[square[1] - 2, square[2] - 1]])
        end
        if square[2] < 8
            append!(attackedSquares, [[square[1] - 2, square[2] + 1]])
        end
    end
    return attackedSquares
end

end