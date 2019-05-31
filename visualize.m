function [  ] = visualize( A , d )
%visualize: Visualize the config A of the masterball in a surfplot via the
%sphere(d)
%

if ~exist('d','var')
    d = 16;
end    

[X,Y,Z] = sphere(d); %coordinates for sphere

surf(X,Y,Z,createColor(A,d));

end

