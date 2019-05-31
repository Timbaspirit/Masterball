function A = turn( A, k )
%turn: Permutates the columns of the matrix A cyclically k times
%

N = size(A,2);

if exist('k','var')
    if k > N || k < 0
        k = mod(k,N);  
    end
else
    k = 1;
end

A=[A(:,end-k+1:end), A(:,1:end-k)];    

end