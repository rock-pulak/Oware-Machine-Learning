function [layers] = initTheta(theta)
% This function loads x and y vectors

  len = length(theta)-1;

	layers = cell(len, 1);
  for i = 1:len
    layers{i} = (rand(theta(i+1), theta(i) + 1)./5) - 0.1;
  endfor
end



