function A = move(A, s, v)
% Executes configuration changes to the configuration A as specified
%in s.
%   Notation;
%   f: front twist (at face 1)
%   t: top pole shift (counterclockwise if not specified)
%   u: upper band shift (")
%   l: lower band shift (")
%   b: bottom pole shift (")
%   r: rotate entire ball (")
%   i: inverts any command
%
%   Examples:    
%   'b f bi'
%   'l2 t f ti b f bi li2'

if ~exist('v','var') %visualisation option
    v = 1;
end

interval = 1; %time interval

commandSequence = split(s); %split commands at whitespace characters

for i = 1:size(commandSequence,1)
   
    command = char(commandSequence(i));
    
    %check if inverted
    if contains(command, 'i') 
        j = -1;
        command = erase(command, 'i');
    else
        j = 1;
    end
    
    %determine how many operations
    if size(command,2) == 1 
        k = 1;
    elseif size(command, 2) > 1
        k = str2double(extractAfter(command, 1));
    else
        error(['Command ' char(commandSequence(i)) ' invalid.']);
    end
    
    %determine function to be used with already determined parameters
    if     startsWith(command, 'f')
        A = front(A, j*k);
    elseif startsWith(command, 't')
        A = shift(A, 1, j*k);
    elseif startsWith(command, 'u')
        A = shift(A, 2, j*k);
    elseif startsWith(command, 'l')
        A = shift(A, 3, j*k);
    elseif startsWith(command, 'b')
        A = shift(A, 4, j*k);
    elseif startsWith(command, 'r')
        A = turn(A, j*k);
    else
        error(['Command ' char(commandSequence(i)) ' is invalid.']);
    end
    
    if v == 1
       visualize(A);
       pause(interval);
    end
    
end

