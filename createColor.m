function C = createColor( A, d )
% Create Color-Matrix for the surfplot to a Masterball with sphere(d) 
%(where mod(d,8)==0) with configuration as described in A
%

[M,N] = size(A);

if M~=4 || N~=8
    error('Matrix dimension(s) invalid')
end

if exist('d','var')
    if mod(d,8)~=0
        error('dimension for sphere command not compatible')
    end
else
    d = 16;
end

xstep = d/4; %Anzahl der übereinanderliegenden Flächen für ein Segment, = 4 für d = 16
ystep = d/8; %Anzahl der nebeneinanderliegenden Flächen für ein Segment,= 2 für d = 16

C = zeros(d,d,3);

colNum = 0;
for v = A
    colNum = colNum + 1;
    rowNum = 5; %so entspricht die erste Zeile der Matrix dem oberen Pol usw
    for x = v'
        rowNum = rowNum - 1;
        if     x == 1   %Rot
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 1) = 1;
        elseif x == 2   %Orange
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 1) = 1;
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 2) = 0.5;
        elseif x == 3   %Gelb
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 1) = 1;
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 2) = 1;
        elseif x == 4   %(Hell-)Grün
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 1) = 0.5;
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 2) = 1;
        elseif x == 5   %Dunkelgrün
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 2) = 0.5;
        elseif x == 6   %Cyan/Hellblau
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 2) = 1;
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 3) = 1;
        elseif x == 7   %Blau
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 3) = 1;
        elseif x == 8   %Violett
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 1) = 0.5;
            C(xstep*(rowNum-1)+1:xstep*rowNum, ystep*(colNum-1)+1:ystep*colNum, 3) = 0.5;
        elseif x == 0   %Schwarz (lassen)
        else
            error(['Value ', x,' invalid at row ', rowNum, ', column ', colNum]);
        end
    end
end

end