module rook

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

    #up
    if square[1] > 1
        for i in square[1]-1:-1:1
            piece = board[i, square[2]]
            if piece == '.'
                append!(attackedSquares, [[i, square[2]]])
            else
                append!(attackedSquares, [[i, square[2]]])
                break
            end
        end
    end

    #down
    if square[1] < 8
        for i in square[1]+1:8
            piece = board[i, square[2]]
            if piece == '.'
                append!(attackedSquares, [[i, square[2]]])
            else
                append!(attackedSquares, [[i, square[2]]])
                break
            end
        end
    end

    #left
    if square[2] > 1
        for i in square[2]-1:-1:1
            piece = board[square[1], i]
            if piece == '.'
                append!(attackedSquares, [[square[1], i]])
            else
                append!(attackedSquares, [[square[1], i]])
                break
            end
        end
    end

    #right
    if square[2] < 8
        for i in square[2]+1:8
            piece = board[square[1], i]
            if piece == '.'
                append!(attackedSquares, [[square[1], i]])
            else
                append!(attackedSquares, [[square[1], i]])
                break
            end
        end
    end

    return attackedSquares
end

end