function [entropyArray, viewArray] = viewpointEntropy( s, m )
%VIEWPOINTENTROPY Summary of this function goes here
%   Detailed explanation goes here

numFrames = size(m, 1);

entropyArray = zeros(numFrames, 1);
viewArray = zeros(numFrames, 2);

for indFrame = 1 : numFrames-1
    
    ma = computeMotionArea(s, m(indFrame:indFrame+1, :));
    [entropy, view] = projectMotionArea(ma);
    
    entropyArray(indFrame) = entropy;
    viewArray(indFrame, :) = view;
end

