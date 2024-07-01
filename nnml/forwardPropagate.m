function [a] = forwardPropagate(Theta, X)
  len = length(Theta)+1;
	a = cell(len, 1);
  a{1} = X';
  for i = 2:len
    a{i} =  g(Theta{i-1} * [ones(1, columns(a{i-1}));a{i-1}]);
  endfor
end
