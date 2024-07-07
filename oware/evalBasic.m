function v = evalBasic(b)
  %todo: input validation
  if b.score(1) > 24
    v = inf;
    return
  elseif b.score(2) > 24
    v = -inf;
    return
  endif
  v = b.score(1)-b.score(2);
  v = v - 0.5 * sum((b.board(1:6))(b.board(1:6) < 3));
  v = v + 0.5 * sum((b.board(7:12))(b.board(7:12) < 3));
end

%TODO:
% Find probability of scoring for an arbitrary board state
% Find probability of scoring based on remaining pieces
