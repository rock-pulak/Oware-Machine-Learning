function gameLog = playGame(south, southDepth, north, northDepth)
  % south and north are function handles that take a normalized game board
  % and return a legal move
  gameLog = [owareBoard()];
  board = gameLog(end);
  while ~hasWinner(board)
    if board.turn == 1
      p = south;
      d = southDepth;
    else
      p = north;
      d = northDepth;
    endif
    tree = minMaxTree(board, d, p);
    move = bestMove(tree, board.turn);
    gameLog = [gameLog moveOware(board, move, board.turn)];
    board = gameLog(end);
  endwhile
end
