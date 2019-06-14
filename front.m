function B = front( A, j )
% Turn the half of ball on the other side, on which column j is the
%furthest to the left
%   Detailed explanation goes here

if ~exist('j','var')
    j = 1;
end

j = j - 1; %trick to avoid getting 0 below

B = A;

B(:, mod(j,8)+1)   = flipud(A(:, mod(j+3,8)+1));
B(:, mod(j+1,8)+1) = flipud(A(:, mod(j+2,8)+1));
B(:, mod(j+2,8)+1) = flipud(A(:, mod(j+1,8)+1));
B(:, mod(j+3,8)+1) = flipud(A(:, mod(j,8)+1));
 
end