module bishop

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

    #up and left
    borderDistanceUL = min(square[1] - 1, square[2] - 1)
    if borderDistanceUL > 0
        for i in 1:borderDistanceUL
            piece = board[square[1] - i, square[2] - i]
            if piece == '.'
                append!(attackedSquares, [[square[1] - i, square[2] - i]])
            else
                append!(attackedSquares, [[square[1] - i, square[2] - i]])
                break
            end
        end
    end

    #up and right
    borderDistanceUR = min(square[1] - 1, 8 - square[2])
    if borderDistanceUR > 0
        for i in 1:borderDistanceUR
            piece = board[square[1] - i, square[2] + i]
            if piece == '.'
                append!(attackedSquares, [[square[1] - i, square[2] + i]])
            else
                append!(attackedSquares, [[square[1] - i, square[2] + i]])
                break
            end
        end
    end

    #down and left
    borderDistanceDL = min(8 - square[1], square[2] - 1)
    if borderDistanceDL > 0
        for i in 1:borderDistanceDL
            piece = board[square[1] + i, square[2] - i]
            if piece == '.'
                append!(attackedSquares, [[square[1] + i, square[2] - i]])
            else
                append!(attackedSquares, [[square[1] + i, square[2] - i]])
                break
            end
        end
    end

    #down and right
    borderDistanceDR = min(8 - square[1], 8 - square[2])
    if borderDistanceDR > 0
        for i in 1:borderDistanceDR
            piece = board[square[1] + i, square[2] + i]
            if piece == '.'
                append!(attackedSquares, [[square[1] + i, square[2] + i]])
            else
                append!(attackedSquares, [[square[1] + i, square[2] + i]])
                break
            end
        end
    end

    return attackedSquares
end

end