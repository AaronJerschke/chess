include("board.jl")
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

function interpretMoveNotation(board, moveChess, white)
    move = []

    if !isnothing(match(r"^[a-h][1-8]$", moveChess)) #e4
        goalSquare = chessSquareToCoords(moveChess)
        if white
            for i in goalSquare[1]+1:7
                if board[i, goalSquare[2]] == 'P'
                    move = [[i, goalSquare[2]], goalSquare]
                end
            end
        else
            for i in goalSquare[1]-1:-1:2
                if board[i, goalSquare[2]] == 'p'
                    move = [[i, goalSquare[2]], goalSquare]
                end
            end
        end

    elseif !isnothing(match(r"^[a-h]x[a-h][1-8]$", moveChess)) #dxc4
        if white
            startSquare = string(moveChess[1], parse(Int, moveChess[4]) - 1)
            goalSquare = moveChess[3:4]
            move = [chessSquareToCoords(startSquare),chessSquareToCoords(goalSquare)]
        else
            startSquare = string(moveChess[1], parse(Int, moveChess[4]) + 1)
            goalSquare = moveChess[3:4]
            move = [chessSquareToCoords(startSquare),chessSquareToCoords(goalSquare)]
        end

    elseif !isnothing(match(r"^[KQBNRP]x?[a-h][1-8]$", moveChess)) #Q(x)h5
        goalSquare = chessSquareToCoords(moveChess[end-1:end])
        
        possibleStartSquares = []

        for i in 1:8
            for j in 1:8
                if board[i, j] == uppercase(moveChess[1]) || board[i, j] == lowercase(moveChess[1])
                    if goalSquare in legalMoves(board, [i, j], emptyBoard)
                        append!(possibleStartSquares, [[i, j]])
                    end
                end
            end
        end

        if length(possibleStartSquares) == 1
            move = [possibleStartSquares[1], goalSquare]
        elseif length(possibleStartSquares) > 1
            println("Error: Move is not unambiguous.")
        elseif length(possibleStartSquares) == 0
            println("Error: Couldn't find a move matching the given notation.")
        end

    elseif !isnothing(match(r"^[QBNRP][a-h]x?[a-h][1-8]$", moveChess)) #Rd(x)f8
        goalSquare = chessSquareToCoords(moveChess[end-1:end])
        
        possibleStartSquares = []

        for i in 1:8
            for j in 1:8
                if (board[i, j] == uppercase(moveChess[1]) || board[i, j] == lowercase(moveChess[1])) && chessSquareToCoords(string(moveChess[2], "1"))[2] == j
                    if goalSquare in legalMoves(board, [i, j], emptyBoard)
                        append!(possibleStartSquares, [[i, j]])
                    end
                end
            end
        end

        if length(possibleStartSquares) == 1
            move = [possibleStartSquares[1], goalSquare]
        elseif length(possibleStartSquares) > 1
            println("Error: Move is not unambiguous.")
        elseif length(possibleStartSquares) == 0
            println("Error: Couldn't find a move matching the given notation.")
        end

    elseif !isnothing(match(r"^[QBNRP][1-8]x?[a-h][1-8]$", moveChess)) #R1(x)a3
        goalSquare = chessSquareToCoords(moveChess[end-1:end])
            
        possibleStartSquares = []

        for i in 1:8
            for j in 1:8
                if (board[i, j] == uppercase(moveChess[1]) || board[i, j] == lowercase(moveChess[1])) && chessSquareToCoords(string("a", moveChess[2]))[2] == i
                    if goalSquare in legalMoves(board, [i, j], emptyBoard)
                        append!(possibleStartSquares, [[i, j]])
                    end
                end
            end
        end

        if length(possibleStartSquares) == 1
            move = [possibleStartSquares[1], goalSquare]
        elseif length(possibleStartSquares) > 1
            println("Error: Move is not unambiguous.")
        elseif length(possibleStartSquares) == 0
            println("Error: Couldn't find a move matching the given notation.")
        end

    elseif !isnothing(match(r"^[KQBNRP][a-h][1-8]x?[a-h][1-8]$", moveChess)) #Qh4(x)e3
        startSquare = chessSquareToCoords(moveChess[2:3])
        goalSquare = chessSquareToCoords(moveChess[end-1:end])

        if board[startSquare[1], startSquare[2]] == uppercase(moveChess[1]) || board[startSquare[1], startSquare[2]] == lowercase(moveChess[1])
            move = [startSquare, goalSquare]
        end

    elseif !isnothing(match(r"^[a-h][1-8]x?[a-h][1-8]$", moveChess)) #h4(x)e3
        startSquare = chessSquareToCoords(moveChess[1:2])
        goalSquare = chessSquareToCoords(moveChess[end-1:end])

        move = [startSquare, goalSquare]

    elseif moveChess == "O-O"
        println("Castling has not yet been implemented.")
    elseif moveChess == "O-O-O"
        println("Castling has not yet been implemented.")
    else
        println("Error: Move notation was not recongnized.")
    end

    return move
end

function legalMovesPiece(board, square, enPassantBoard)
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
        tempLegalMoves = pawn.legalMoves(board, square, enPassantBoard)
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

function safeMove!(board, startSquare, goalSquare, enPassantBoard)
    returnVal = 0

    legalMoves = legalMovesPiece(board, startSquare, enPassantBoard)

    if goalSquare in legalMoves
        if enPassantBoard[goalSquare[1], goalSquare[2]] == 'X'
            if board[startSquare[1], startSquare[2]] == 'P'
                board[goalSquare[1] + 1, goalSquare[2]] = '.'
            elseif board[startSquare[1], startSquare[2]] == 'p'
                board[goalSquare[1] - 1, goalSquare[2]] = '.'
            end
        end

        if enPassantBoard != emptyBoard
            for i in 1:8
                for j in 1:8
                    enPassantBoard[i, j] = '.'
                end
            end
        end

        if startSquare[1] - goalSquare[1] == 2 && board[startSquare[1], startSquare[2]] == 'P'
            #en passant possible in the next move
            enPassantBoard[startSquare[1] - 1, startSquare[2]] = 'X'
        elseif goalSquare[1] - startSquare[1] == 2 && board[startSquare[1], startSquare[2]] == 'p'
            #en passant possible in the next move
            enPassantBoard[startSquare[1] + 1, startSquare[2]] = 'X'
        end

        move!(board, startSquare, goalSquare)
    else
        println("This is not a legal move")
        returnVal = -1
    end
    return returnVal
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
    mAttackedSquares = attackedSquares(board, !white)

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
    
    if posKing in mAttackedSquares
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
                moves = legalMoves(board, [i, j], emptyBoard)
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