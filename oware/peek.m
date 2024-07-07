function n = peek(b, i, t)
  n = owareBoard();
  n.board = b.board;
  n.score = b.score;
  n.turn = b.turn;
  n = moveOware(n, i, t);
end
