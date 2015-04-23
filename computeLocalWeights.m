function weights = computeLocalWeights(s, m)

    numJoints = length(s.tree);
    numFrames = size(m, 1);
    
    weights = zeros(numFrames, numJoints, 3);
    
    for indJoint = 1 : numJoints
        dist = norm(s.tree(indJoint).offset) ;       
        rotInds = s.tree(indJoint).rotInd;
        if (isempty(rotInds))
            continue;
        end
        for indFrame = 1 : numFrames-1
            diffRotAngles = abs(m(indFrame+1, rotInds) - m(indFrame, rotInds));
            weights(indFrame, indJoint, :) = dist*diffRotAngles;
        end
       
    end

end