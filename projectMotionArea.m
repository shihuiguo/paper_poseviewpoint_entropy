function [entropy, vecProj] = projectMotionArea( ma )
%PROJECTIONMOTIONAREA Summary of this function goes here
%   Detailed explanation goes here

numMA = size(ma, 1);
totalMA = zeros(3, 3);

for indMA = 1 : numMA
    
    A = ;
    B = ;
    C = ;
    D = ;
    
    crossAB = cross(A, B);
    crossCD = cross(C, D);
    totalMA = totalMA + (crossAB*crossAB' +  crossCD*crossCD')/4;
    
end

[V, D] = eig(totalMA);

vecProj = V(:, 1);

entropy = vecProj'*totalMA*vecProj;

end

