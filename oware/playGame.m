function gameLog = playGame(south, north)
  % south and north are function handles that take a normalized game board
  % and return a legal move
  gameLog = [owareBoard()];
  board = gameLog(end);
  while ~hasWinner(board)
    if board.turn == 1
      p = south;
    else
      p = north;
    endif
    move = p(normalizeBoard(board));
    gameLog = [gameLog MoveOware(board, move, board.turn)];
    board = gameLog(end);
  endwhile
end
