function gameLog = playGame(south, southDepth, north, northDepth)
  % south and north are function handles that take a normalized game board
  % and return a legal move
  gameLog = [OwareBoard()];
  board = gameLog(end);
  while board.Winner() == 0
    if board.Turn == 1
      p = south;
      d = southDepth;
    else
      p = north;
      d = northDepth;
    endif
    tree = minMaxTree(board, d, p);
    move = bestMove(tree, board.Turn);
    gameLog = [gameLog board.Move(move, board.Turn)];
    board = gameLog(end);
  endwhile
end
