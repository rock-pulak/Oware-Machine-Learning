function n = normalizeBoard(b)
  if b.turn == 1
    n = [b.board b.score];
  else
    n = [b.board(7:12) b.board(1:6) b.score(end:-1:1)];
  endif
end
