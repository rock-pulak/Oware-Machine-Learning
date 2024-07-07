function b = moveOware(b, i, t)
  if i < 1 || i > 6
    error('Must choose a space between 1 and 6')
  elseif t ~= b.turn
    error('Wrong player attempted to move')
  end

  i = i + 6*(t-1);
  if b.board(1, i) == 0
    error('Chosen space is empty')
  end

  add = mod(b.board(i), 11);
  e = mod(i - 1 + add, 12) + 1;
  b.board = (b.board + ones(1, 12) .* fix(b.board(i)./11)) .* ([1:12] != i);
  b.board(([mod(i:i+add-1, 12)] + 1)) =  b.board(([mod(i:i+add-1, 12)] + 1))+1;

  %todo: Simplify
  while (b.board(e) == 2 || b.board(e) == 3) && fix(e/6)+1 ~= t
    b.score(b.turn) = b.score(b.turn) + b.board(e);
    b.board(e) = 0;
    e = mod(e-2, 12) + 1;
  end
  b.turn = 3-b.turn;
  if sum(b.board(1:6)) == 0 || sum(b.board(7:12)) == 0
    b.score(b.turn) = b.score(b.turn) + sum(b.board);
    board = zeros(1, 12);
  endif
end
