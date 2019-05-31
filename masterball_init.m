function M = masterball_init( a )
%masterball_init: Initialize and return the configuration matrix 
%for the solved masterball with the given side a facing to the front
% (1 is red, 2 orange, ... , 8 purple)

if ~exist('a','var')
    a = 1;
end

M = [1 2 3 4 5 6 7 8;...
     1 2 3 4 5 6 7 8;...
     1 2 3 4 5 6 7 8;...
     1 2 3 4 5 6 7 8];
 
M = turn(M, -a+1);

end