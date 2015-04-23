function ma = computeMotionArea_Iteration(indJoint, s, curXYZ, nextXYZ )
%COMPUTEMOTIONAREA_ITERATION Summary of this function goes here
%   Detailed explanation goes here


ma = [];
children = s.tree(indJoint).children;

if isempty(children)
    return 
end

for indChild = 1 : numl(children)
    singleMA = [curXYZ(indJoint, :) curXYZ(children(indChild)) nextXYZ(children(indChild)) nextXYZ(indJoint, :)];
    ma = [ma; singleMA];    
    childMA = computeMotionArea_Iteration(children(indChild), s, curXYZ, nextXYZ);
    ma = [ma; childMA];
end

end

