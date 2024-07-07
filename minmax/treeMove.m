function root = treeMove(root, move)
  %todo: Handle error
  root = root.children{move};
  root.parent = {};
end
