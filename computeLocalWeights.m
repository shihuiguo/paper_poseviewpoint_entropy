function weights = computeLocalWeights(s, m)

    numJoints = length(s.tree);
    numFrames = size(m, 1);
    
    weights = zeros(numFrames, numJoints, 3);
    
    distArray = zeros(numJoints);
    for indJoint = 1 : numJoints
        distArray(indJoint) = norm(s.tree(indJoint).offset);
    end
    distArray = distArray/norm(distArray);
    
    for indJoint = 1 : numJoints
        dist = distArray(indJoint);
        rotInds = s.tree(indJoint).rotInd;
        if (isempty(rotInds))
            continue;
        end
        for indFrame = 1 : numFrames-1
            diffRotAngles = abs(m(indFrame+1, rotInds) - m(indFrame, rotInds));
            weights(indFrame, indJoint, :) = dist*diffRotAngles/norm(diffRotAngles);
        end
       
    end
    weights(isnan(weights)) = 0;
end