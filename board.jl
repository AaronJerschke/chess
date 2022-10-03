startBoard = [
    'r' 'n' 'b' 'q' 'k' 'b' 'n' 'r';
    'p' 'p' 'p' 'p' 'p' 'p' 'p' 'p';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    'P' 'P' 'P' 'P' 'P' 'P' 'P' 'P';
    'R' 'N' 'B' 'Q' 'K' 'B' 'N' 'R'
]
emptyBoard = [
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.'
]

customBoard1 = [
    'r' 'n' 'b' 'q' 'k' 'b' 'n' 'r';
    'p' 'p' 'p' 'p' 'p' '.' '.' 'p';
    '.' '.' '.' '.' '.' 'p' '.' '.';
    '.' '.' '.' '.' '.' '.' 'p' 'Q';
    '.' '.' '.' '.' 'P' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    'P' 'P' 'P' 'P' '.' 'P' 'P' 'P';
    'R' 'N' 'B' '.' 'K' 'B' 'N' 'R'
]

function printBoard(board)
    for i in 1:8
        for j in 1:8
            print(board[i, j])
            print(" ")
        end
        println()
    end
    println()
end

function printBoardMarkings(squares) #takes array of squares and marks them with an X
    tempBoard = copy(emptyBoard)
    if !isempty(squares)
        for square in squares
            tempBoard[square[1], square[2]] = 'X'
        end
    end
    printBoard(tempBoard)
end

function coordsToChessSquare(square)
    file = ""
    
    if square[2] == 1
        file = "a"
    elseif square[2] == 2
        file = "b"
    elseif square[2] == 3
        file = "c"
    elseif square[2] == 4
        file = "d"
    elseif square[2] == 5
        file = "e"
    elseif square[2] == 6
        file = "f"
    elseif square[2] == 7
        file = "g"
    elseif square[2] == 8
        file = "h"
    end

    return string(file, 9 - square[1])
end

function chessSquareToCoords(chessSquare)
    x = 9 - parse(Int, chessSquare[2])

    y = 0
    file = chessSquare[1]
    if file == 'a'
        y = 1
    elseif file == 'b'
        y = 2
    elseif file == 'c'
        y = 3
    elseif file == 'd'
        y = 4
    elseif file == 'e'
        y = 5
    elseif file == 'f'
        y = 6
    elseif file == 'g'
        y = 7
    elseif file == 'h'
        y = 8
    end

    return [x, y]
end