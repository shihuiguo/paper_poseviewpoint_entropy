function ma = computeMotionArea(s, m)
%COMPUTEMOTIONAREA Summary of this function goes here
%   Detailed explanation goes here


curXYZ = skel2xyz(s, m(1, :));  
nextXYZ = skel2xyz(s, m(2, :));


ma = computeMotionArea_Iteration(1, s, curXYZ, nextXYZ);


end

