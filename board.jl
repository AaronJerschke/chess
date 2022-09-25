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

customBoard2 = [
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' 'q' '.' '.' '.';
    '.' '.' '.' '.' 'K' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.';
    '.' '.' '.' '.' '.' '.' '.' '.'
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
    tempBoard = [
        '.' '.' '.' '.' '.' '.' '.' '.';
        '.' '.' '.' '.' '.' '.' '.' '.';
        '.' '.' '.' '.' '.' '.' '.' '.';
        '.' '.' '.' '.' '.' '.' '.' '.';
        '.' '.' '.' '.' '.' '.' '.' '.';
        '.' '.' '.' '.' '.' '.' '.' '.';
        '.' '.' '.' '.' '.' '.' '.' '.';
        '.' '.' '.' '.' '.' '.' '.' '.'
    ]
    if !isempty(squares)
        for square in squares
            tempBoard[square[1], square[2]] = 'X'
        end
    end
    printBoard(tempBoard)
end

function coordsToChess(square)
    file = ""
    
    if square[2] == 1
        file = "A"
    elseif square[2] == 2
        file = "B"
    elseif square[2] == 3
        file = "C"
    elseif square[2] == 4
        file = "D"
    elseif square[2] == 5
        file = "E"
    elseif square[2] == 6
        file = "F"
    elseif square[2] == 7
        file = "G"
    elseif square[2] == 8
        file = "H"
    end

    return string(file, 9 - square[1])
end

function chessToCoords(chessSquare)
    x = 9 - parse(Int, chessSquare[2])

    y = 0
    file = chessSquare[1]
    if file == 'A'
        y = 1
    elseif file == 'B'
        y = 2
    elseif file == 'C'
        y = 3
    elseif file == 'D'
        y = 4
    elseif file == 'E'
        y = 5
    elseif file == 'F'
        y = 6
    elseif file == 'G'
        y = 7
    elseif file == 'H'
        y = 8
    end

    return [x, y]
end