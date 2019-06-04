function A = shift( A, i, k )
% Shifts the ith row of the Matrix A to the right k times.
%   A Matrix, i row index, k shift number

[M,N] = size(A);

if i>M
    error(['Row index ', i, ' is out of bounds for the matrix A.'])
end

if exist('k','var')
    if k > N || k < 0
        k = mod(k,N);  
    end
else
    k = 1;
end  

A(i,:) = [A(i,end-k+1:end) A(i,1:end-k)]; 

end