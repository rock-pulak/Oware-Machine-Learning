function n = isLegalMove(b, ii, t)
   n = (ii >= 1) && (ii <= 6) && b.board((6*(t-1) + ii)) ~= 0;
end
