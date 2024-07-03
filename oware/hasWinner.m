function w = hasWinner(b)
  if b.score(1)== 24 && b.score(2) == 24
      w = 3;
    elseif length(b.score(b.score >= 24)) ~= 0
      w = find(b.score >= 24);
    else
      w = length(b.score(b.score >= 24)) ~= 0;
  endif
end
