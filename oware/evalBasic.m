function v = evalBasic(b)
  %todo: input validation
  if b.Score(1) > 24
    v = inf;
    return
  elseif b.Score(2) > 24
    v = -inf;
    return
  endif
  v = b.Score(1)-b.Score(2);
  v = v - 0.5 * sum((b.Board(1:6))(b.Board(1:6) < 3));
  v = v + 0.5 * sum((b.Board(7:12))(b.Board(7:12) < 3));
end

%TODO:
% Find probability of scoring for an arbitrary board state
% Find probability of scoring based on remaining pieces
