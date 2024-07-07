function root = deepenTo(root, depth, heuristic)
  %error handling
  if depth == 0 || ~isa(root, 'struct')
    return
  endif
  state = root.state;
  for i = 1:6
    if isa(root.children{i}, 'struct')
      root.children{i} = deepenTo(root.children{i}, depth-1, heuristic);
     elseif isLegalMove(state, i, state.turn)
      n = minMaxTree(peek(state, i, state.turn), depth-1, heuristic, root);
      root.children{i} = n;
    endif
    if depth ~= 0
      co = {@gt, @lt}{state.turn};
      cv = [-inf, inf](state.turn);
      for i = 1:6
        if isa(root.children{i}, 'struct')
          if co(root.children{i}.score, cv)
            cv = root.children{i}.score;
          endif
        endif
      endfor
      root.score = cv;
    endif
  endfor
end
