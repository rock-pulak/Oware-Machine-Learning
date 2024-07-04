%size = 1000;
%gc = cell(1, size);
%for i = 1:size
%  g = playGame( @playRandom, @playRandom);
%  gc{i} = g;
%end

%results = [0 0 0];
%for i = 1:size
%  index = hasWinner(gc{i}(end));
%  results(index) = results(index) + 1;
%end
%results


t = minMaxTree(owareBoard(), 2, @(b)1);
