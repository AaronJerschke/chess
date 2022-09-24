module board

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

customBoard = [
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

end