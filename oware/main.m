%size = 100;
%gc = cell(1, size);
%for i = 1:size
%  g = playGame( @evalBasic, 3, @evalBasic, 3);
%  gc{i} = g;
%end
%results = [0 0 0];
%for i = 1:size
%  index = hasWinner(gc{i}(end));
%  results(index) = results(index) + 1;
%end
%results

playGame( @evalBasic, 3, @evalBasic, 3)
