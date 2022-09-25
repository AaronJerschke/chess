module queen

include("bishop.jl")
include("rook.jl")
import .bishop
import .rook

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

    append!(attackedSquares, bishop.attackedSquares(board, square))
    append!(attackedSquares, rook.attackedSquares(board, square))
    
    return attackedSquares
end

end