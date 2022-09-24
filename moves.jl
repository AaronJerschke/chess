module moves

include("pawn.jl")
include("knight.jl")
include("king.jl")
include("bishop.jl")
include("rook.jl")
include("queen.jl")
import .pawn
import .knight
import .king
import .bishop
import .rook
import .queen

function attackedSquares(board, white)
    attackedSquares = []
    if white
        for i in 1:8
            for j in 1:8
                piece = board[i, j]
                if piece == 'K'
                    append!(attackedSquares, king.attackedSquares(board, [i, j]))
                elseif piece == 'Q'
                    #append!(attackedSquares, queen.attackedSquares(board, [i, j]))
                elseif piece == 'B'
                    #append!(attackedSquares, bishop.attackedSquares(board, [i, j]))
                elseif piece == 'N'
                    append!(attackedSquares, knight.attackedSquares(board, [i, j]))
                elseif piece == 'R'
                    #append!(attackedSquares, rook.attackedSquares(board, [i, j]))
                elseif piece == 'P'
                    append!(attackedSquares, pawn.attackedSquares(board, [i, j]))
                end
            end
        end
    else
        for i in 1:8
            for j in 1:8
                piece = board[i, j]
                if piece == 'k'
                    append!(attackedSquares, king.attackedSquares(board, [i, j]))
                elseif piece == 'q'
                    #append!(attackedSquares, queen.attackedSquares(board, [i, j]))
                elseif piece == 'b'
                    #append!(attackedSquares, bishop.attackedSquares(board, [i, j]))
                elseif piece == 'n'
                    append!(attackedSquares, knight.attackedSquares(board, [i, j]))
                elseif piece == 'r'
                    #append!(attackedSquares, rook.attackedSquares(board, [i, j]))
                elseif piece == 'p'
                    append!(attackedSquares, pawn.attackedSquares(board, [i, j]))
                end
            end
        end
    end
    return unique(attackedSquares, dims=1)
end

function isChecked(board, white)
    attackedSquares = moves.attackedSquares(board, !white)

    posKing = [0, 0]
    
    for i in 1:8
        for j in 1:8
            if white && board[i, j] == 'K'
                posKing = [i, j]
            elseif !white && board[i, j] == 'k'
                posKing = [i, j]
            end
        end
    end
    
    if posKing in attackedSquares
        check = true
    else
        check = false
    end

    return check
end

end