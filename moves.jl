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

function interpretMoveNotation(board, move, white)
    move = []

    if isnothing(match(r"[a-h][1-8]", move)) #e4
        square = chessSquareToCoords(move)
        if white
            for i in square[1]+1:7
                if board[square[1], square[2]] == 'P'
                    move = [[i, square[2]], square]
                end
            end
        else
            for i in square[1]-1:-1:2
                if board[square[1], square[2]] == 'p'
                    move = [[i, square[2]], square]
                end
            end
        end
    #elseif !isnothing(match(r"[a-h]x[a-h][1-8]", move)) #dxc4

    #elseif !isnothing(match(r"[KQBNRP][a-h][1-8]", move)) #Qh5

    #elseif !isnothing(match(r"[KQBNRP]x[a-h][1-8]", move)) #Qxd4

    #elseif !isnothing(match(r"[QBNRP][a-h][a-h][1-8]", move)) #Rdf8

    #elseif !isnothing(match(r"[QBNRP][1-8][a-h][1-8]", move)) #R1a3

    #elseif !isnothing(match(r"[QBNRP][a-h][1-8]x?[a-h][1-8]", move)) #Qh4(x)e3

    else
        println("Move notation was not recongnized.")
    end

    return move
end

function legalMoves(board, square)
    tempLegalMoves = []
    if board[square[1], square[2]] == 'K' || board[square[1], square[2]] == 'k'
        tempLegalMoves = king.legalMoves(board, square)
    elseif board[square[1], square[2]] == 'Q' || board[square[1], square[2]] == 'q'
        tempLegalMoves = queen.legalMoves(board, square)
    elseif board[square[1], square[2]] == 'B' || board[square[1], square[2]] == 'b'
        tempLegalMoves = bishop.legalMoves(board, square)
    elseif board[square[1], square[2]] == 'N' || board[square[1], square[2]] == 'n'
        tempLegalMoves = knight.legalMoves(board, square)
    elseif board[square[1], square[2]] == 'R' || board[square[1], square[2]] == 'r'
        tempLegalMoves = rook.legalMoves(board, square)
    elseif board[square[1], square[2]] == 'P' || board[square[1], square[2]] == 'p'
        tempLegalMoves = pawn.legalMoves(board, square)
    end

    #check if move puts own king in check
    legalMoves = []
    if !isempty(tempLegalMoves)
        isWhite = isuppercase(board[square[1], square[2]])

        for move in tempLegalMoves
            tempBoard = copy(board)
            move!(tempBoard, square, move)
            if !isChecked(tempBoard, isWhite)
                append!(legalMoves, [move])
            end
        end
    end

    return legalMoves
end

function move!(board, startSquare, goalSquare)
    board[goalSquare[1], goalSquare[2]] = board[startSquare[1], startSquare[2]]
    board[startSquare[1], startSquare[2]] = '.'
    return nothing
end

function safeMove!(board, startSquare, goalSquare)
    piece = board[startSquare[1], startSquare[2]]
    legalMoves = []
    if piece == '.'
        println("There is no piece in square ", startSquare)
    elseif piece == 'K' || piece == 'k'
        legalMoves = king.legalMoves(board, startSquare)
    elseif piece == 'Q' || piece == 'q'
        legalMoves = queen.legalMoves(board, startSquare)
    elseif piece == 'B' || piece == 'b'
        legalMoves = bishop.legalMoves(board, startSquare)
    elseif piece == 'N' || piece == 'n'
        legalMoves = knight.legalMoves(board, startSquare)
    elseif piece == 'R' || piece == 'r'
        legalMoves = rook.legalMoves(board, startSquare)
    elseif piece == 'P' || piece == 'p'
        legalMoves = pawn.legalMoves(board, startSquare)
    end

    if goalSquare in legalMoves
        move!(board, startSquare, goalSquare)
    else
        println("This is not a legal move")
    end
    return nothing
end

function attackedSquares(board, white)
    attackedSquares = []
    if white
        for i in 1:8
            for j in 1:8
                piece = board[i, j]
                if piece == 'K'
                    append!(attackedSquares, king.attackedSquares(board, [i, j]))
                elseif piece == 'Q'
                    append!(attackedSquares, queen.attackedSquares(board, [i, j]))
                elseif piece == 'B'
                    append!(attackedSquares, bishop.attackedSquares(board, [i, j]))
                elseif piece == 'N'
                    append!(attackedSquares, knight.attackedSquares(board, [i, j]))
                elseif piece == 'R'
                    append!(attackedSquares, rook.attackedSquares(board, [i, j]))
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
                    append!(attackedSquares, queen.attackedSquares(board, [i, j]))
                elseif piece == 'b'
                    append!(attackedSquares, bishop.attackedSquares(board, [i, j]))
                elseif piece == 'n'
                    append!(attackedSquares, knight.attackedSquares(board, [i, j]))
                elseif piece == 'r'
                    append!(attackedSquares, rook.attackedSquares(board, [i, j]))
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

function isMate(board, white)
    mate = true

    if !isChecked(board, white)
        mate = false
    end
    
    for i in 1:8
        for j in 1:8
            if isuppercase(board[i, j]) == white
                moves = legalMoves(board, [i, j])
                for move in moves
                    tempBoard = copy(board)
                    move!(tempBoard, [i, j], move)
                    if !isChecked(tempBoard, white)
                        mate = false
                    end
                end
            end
        end
    end

    return mate
end