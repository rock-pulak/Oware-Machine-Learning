function r = playRandom(b)
  options = [1:6](b(1:6) ~= 0);
  if length(options) > 1
    r = randsample(options, 1);
  else
    r = options;
  endif
end
