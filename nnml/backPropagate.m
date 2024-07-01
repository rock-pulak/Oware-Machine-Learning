function [D] = backPropagate(Theta, A, Y, Lambda)
  m = columns(Y);
  len = length(Theta);

  D = cell(len,1);
  delta = cell(len+1,1);
  delta{end} = A{end} - Y;
  for i = len:-1:2
    delta{i} = (Theta{i}(:,2:end)'*delta{i+1}).*(A{i}.*(1-A{i}));
  endfor
  for i = len:-1:1
    D{i} = [sum(delta{i+1}, 2) (delta{i+1}*A{i}' + Lambda*Theta{i}(:,2:end))]/m;
  endfor
  delta
end
