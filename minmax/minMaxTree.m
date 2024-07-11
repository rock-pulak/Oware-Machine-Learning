function root = minMaxTree(state, depth, heuristic, parent)
  if nargin < 3
    error("Must have at least at least an initial state, state generator and heuristic");
  endif
  root = struct();
  root.state = state;
  root.score = heuristic(state);
  root.children = cell(1, 6);
  if nargin == 4
    root.parent = {parent};
  else
    root.parent = {};
  endif
  %TODO: Pruning
  if depth > 0
    for i = 1:6
      if state.LegalMove( i, state.Turn)
        n = minMaxTree(state.Move(i, state.Turn), depth-1, heuristic, root);
        root.children{i} = n;
      endif
    endfor
    if depth ~= 0
      co = {@gt, @lt}{state.Turn};
      cv = [-inf, inf](state.Turn);
      for i = 1:6
        if isa(root.children{i}, 'struct')
          if co(root.children{i}.score, cv)
            cv = root.children{i}.score;
          endif
        endif
      endfor
      root.score = cv;
    endif
  endif
end
