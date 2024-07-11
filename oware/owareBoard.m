classdef OwareBoard
  properties
    Board
    Score
    Turn
  endproperties

  methods
    %TODO: Genericize this
    function obj = OwareBoard(template)
      if nargin == 1
        obj.Board = template.Board;
        obj.Score = template.Score;
        obj.Turn = template.Turn;
      else
        obj.Board = ones(1, 12) * 4;
        obj.Score = zeros(1, 2);
        obj.Turn = 1;
      endif
    endfunction

    function a = Normalize(obj)
      if obj.Turn == 1
        a = [obj.Board obj.Score];
      else
        a = [obj.Board(7:12) obj.Board(1:6) obj.Score(end:-1:1)];
      endif
    endfunction

    function w = Winner(obj)
      if obj.Score(1)== 24 && obj.Score(2) == 24
          w = 3;
        elseif length(obj.Score(obj.Score >= 24)) ~= 0
          w = find(obj.Score >= 24);
        else
          w = length(obj.Score(obj.Score >= 24)) ~= 0;
      endif
    endfunction

    function legal = LegalMove(obj, i, t)
      legal = (i >= 1) && (i <= 6) && b.board((6*(t-1) + i)) ~= 0;
    endfunction

    function nObj = Move(obj, i, t)
      i = i + 6*(t-1);
      add = mod(obj.Board(i), 11);
      e = mod(i - 1 + add, 12) + 1;
      nObj = OwareBoard(obj);
      nObj.Board = (nObj.Board + ones(1, 12) .* fix(nObnj.Board(i)./11)) .* ([1:12] != i);
      nObj.Board(([mod(i:i+add-1, 12)] + 1)) =  nObj.Board(([mod(i:i+add-1, 12)] + 1))+1;

      %todo: Simplify
      while (nObj.Board(e) == 2 || nObj.Board(e) == 3) && fix(e/6)+1 ~= t
        nObj.Score(nObj.Turn) = nObj.Score(nObj.Turn) + nObj.Board(e);
        nObj.Board(e) = 0;
        e = mod(e-2, 12) + 1;
      end
      nObj.Turn = 3-nObj.Turn;
      if sum(nObj.Board(1:6)) == 0 || sum(nObj.Board(7:12)) == 0
        nObj.Score(nObj.Turn) = nObj.Score(nObj.Turn) + sum(nObj.Board);
        nObj.Board = zeros(1, 12);
      endif
    endfunction
  endmethods
endclassdef
