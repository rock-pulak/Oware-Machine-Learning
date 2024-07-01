function [cost] = J(theta, a, Y, lambda)
  m = length(a);
  e = sum(sum((-ln(a).*Y) - (ln(1-a).*(1-Y))));
  adj = 0;
  for i = 1:length(theta)
    adj += sum(sum(theta{i}(:,2:end).^2));
  endfor
  cost = (e+adj*lambda/2)/m;
end
