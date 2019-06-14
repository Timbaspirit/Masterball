function C = characterizeSequences( N )
%Characterizes all possible sequnces of given length n as to how many panels
%it has (not) changed
%   n: precisely the amount of moves it takes to execute the sequences to
%   be endowed.

C = cell(33,1); %preallocation, one cell for each list, 
%C{n} will contain all sequences that after application have n+1 different panels 
for i = 1:33
    C{i} = {};
end
L = undec_list_fast(N);
M = masterball_init;

for r = L'
    seq = '';
    for i = 1:length(r)
        if r(i) == 1
            seq = [seq, 'f '];
        elseif r(i) == 2
            seq = [seq, 't '];
        elseif r(i) == 3
            seq = [seq, 'u '];
        elseif r(i) == 4
            seq = [seq, 'l '];
        elseif r(i) == 5
            seq = [seq, 'b '];
        elseif r(i) == 6
            seq = [seq, 'r '];
        elseif r(i) == 7
            seq = [seq, 'ti '];
        elseif r(i) == 8
            seq = [seq, 'ui '];
        elseif r(i) == 9
            seq = [seq, 'li '];
        elseif r(i) == 10
            seq = [seq, 'bi '];
        elseif r(i) == 11
            seq = [seq, 'ri '];
        end
    end
    seq = deblank(seq);
    compMat = M == move(M, seq, 0);
    S = sum(compMat(:));
    C{S+1}{end+1} = seq;    
end