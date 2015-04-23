function entropyArray = poseEntropy_Local( probLocal, weightLocal )
%POSEENTROPY_LOCAL Summary of this function goes here
%   Detailed explanation goes here
    [numFrames, numJoints, numChannels] = size(probLocal);    
    entropyArray = zeros(numFrames, 1);
    
    for indFrame  = 1 : numFrames
        entropy = 0;
        probFrame = squeeze(probLocal(indFrame, :, :));
        weightFrame = squeeze(weightLocal(indFrame, :, :));
        for indJoint = 1 : numJoints
            prob = probFrame(indJoint, :) * weightFrame(indJoint, :)';
            if prob ~= 0                
                entropy = entropy - prob*log2(prob);
            end
        end
        entropyArray(indFrame) = entropy;
    end

end

