function [newY] = prepareY(y)
	newY = (1:max(y) == y)';
end
