function root = minMaxTree(state, generator, heuristic, parent)
  if nargin < 3
    error("Must have at least at least an initial state, state generator and heuristic");
  endif
  root = struct('state', state, 'score', heuristic(state), 'children', {}, 'parents', {});
  if nargin == 4
    root.parents = [root.parents parent];
  endif

end
