WIDTH = 744
HEIGHT = 744
BACKGROUND = colorant"antiquewhite"

board = Actor("background")
#White Pieces
wking = Actor("wKing")
wking.x = 372
wking.y = 651
wqueen = Actor("wQueen")
wqueen.x = 279
wqueen.y = 651
wcbishop = Actor("wBishop")
wcbishop.x = 186
wcbishop.y = 651
wfbishop = Actor("wBishop")
wfbishop.x = 465
wfbishop.y = 651
wbknight = Actor("wKnight")
wbknight.x = 93
wbknight.y = 651
wgknight = Actor("wKnight")
wgknight.x = 558
wgknight.y = 651
warook = Actor("wRook")
warook.x = 0
warook.y = 651
whrook = Actor("wRook")
whrook.x = 651
whrook.y = 651
#White Pawns
wapawn = Actor("wPawn")
wapawn.x = 0
wapawn.y = 558
wbpawn = Actor("wPawn")
wbpawn.x = 93
wbpawn.y = 558
wcpawn = Actor("wPawn")
wcpawn.x = 186
wcpawn.y = 558
wdpawn = Actor("wPawn")
wdpawn.x = 279
wdpawn.y = 558
wepawn = Actor("wPawn")
wepawn.x = 372
wepawn.y = 558
wfpawn = Actor("wPawn")
wfpawn.x = 465
wfpawn.y = 558
wgpawn = Actor("wPawn")
wgpawn.x = 558
wgpawn.y = 558
whpawn = Actor("wPawn")
whpawn.x = 651
whpawn.y = 558
#Black Pieces
bking = Actor("bKing")
bking.x = 372
bking.y = 0
bqueen = Actor("bQueen")
bqueen.x = 279
bqueen.y = 0
bcbishop = Actor("bBishop")
bcbishop.x = 186
bcbishop.y = 0
bfbishop = Actor("bBishop")
bfbishop.x = 465
bfbishop.y = 0
bbknight = Actor("bKnight")
bbknight.x = 93
bbknight.y = 0
bgknight = Actor("bKnight")
bgknight.x = 558
bgknight.y = 0
barook = Actor("bRook")
barook.x = 0
barook.y = 0
bhrook = Actor("bRook")
bhrook.x = 651
bhrook.y = 0
#Black Pawns
bapawn = Actor("bPawn")
bapawn.x = 0
bapawn.y = 93
bbpawn = Actor("bPawn")
bbpawn.x = 93
bbpawn.y = 93
bcpawn = Actor("bPawn")
bcpawn.x = 186
bcpawn.y = 93
bdpawn = Actor("bPawn")
bdpawn.x = 279
bdpawn.y = 93
bepawn = Actor("bPawn")
bepawn.x = 372
bepawn.y = 93
bfpawn = Actor("bPawn")
bfpawn.x = 465
bfpawn.y = 93
bgpawn = Actor("bPawn")
bgpawn.x = 558
bgpawn.y = 93
bhpawn = Actor("bPawn")
bhpawn.x = 651
bhpawn.y = 93

function draw(g::Game)
    draw(board)

    draw(wking)
    draw(wqueen)
    draw(wcbishop)
    draw(wfbishop)
    draw(wbknight)
    draw(wgknight)
    draw(warook)
    draw(whrook)

    draw(wapawn)
    draw(wbpawn)
    draw(wcpawn)
    draw(wdpawn)
    draw(wepawn)
    draw(wfpawn)
    draw(wgpawn)
    draw(whpawn)

    draw(bking)
    draw(bqueen)
    draw(bcbishop)
    draw(bfbishop)
    draw(bbknight)
    draw(bgknight)
    draw(barook)
    draw(bhrook)

    draw(bapawn)
    draw(bbpawn)
    draw(bcpawn)
    draw(bdpawn)
    draw(bepawn)
    draw(bfpawn)
    draw(bgpawn)
    draw(bhpawn)
end