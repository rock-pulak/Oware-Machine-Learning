function root = minMaxTree(state, depth, heuristic, parent)
  if nargin < 3
    error("Must have at least at least an initial state, state generator and heuristic");
  endif
  root = struct('state', state, 'score', heuristic(state), 'children', cell(1, 6), 'parents', cell(1));
  if nargin == 4
    root(1).parents = {root.parents parent};
  endif
  % todo: Find stuff

  if depth > 0
    for i = [1:6](isLegalMove(state, i, state.turn))
      n = minMaxTree(MoveOware(state, i, state.turn), depth-1, heuristic, root);
      root.children{i} = n;
    endfor
  endif
end
