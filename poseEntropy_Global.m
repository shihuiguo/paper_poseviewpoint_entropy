function entropyArray = poseEntropy_Global( prob, eventsFrame )
%POSEENTROPY_GLOBAL Summary of this function goes here
%   Detailed explanation goes here

    [numFrames, numJoints] = size(eventsFrame);
    entropyArray = zeros(numFrames, 1);
    
    for indFrame = 1 : numFrames        
        % probIndFrame = prob(indFrame, :);
        entropy = 0;
        for indJoint = 1 : numJoints
            if eventsFrame(indFrame, indJoint) ~= 0
                % entropy = entropy - probIndFrame(indJoint) * log2(probIndFrame(indJoint));
                entropy = entropy - prob(indJoint) * log2(prob(indJoint));
            end             
        end
        entropyArray(indFrame) = entropy;
    end
end

