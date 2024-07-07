function m = bestMove(root, player)
  r = [];
  if player == 2
    x = inf;
    rf = @lt;
  else
    x = -inf;
    rf = @gt;
  endif

  for i = 1:6
    if isa(root.children{i}, 'struct') > 0
      if rf(root.children{i}.score, x)
        x = root.children{i}.score;
        r = [i];
      elseif eq(root.children{i}.score, x)
        r = [r i];
      endif
    endif
  endfor
  if length(r) > 1
    m = randsample(r, 1);
  else
    m = r;
  endif
end
