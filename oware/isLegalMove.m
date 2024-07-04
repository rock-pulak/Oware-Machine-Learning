function b = isLegalMove(b, i, t)
   b = i >= 1 && i <= 6 && i+6*(t-1) ~= 0;
end
