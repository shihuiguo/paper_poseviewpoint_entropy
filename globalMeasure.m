function prob = globalMeasure(eventFrames)

    % eventFrames = findConstraints(s, m);
    
    [numFrames, numJoints] = size(eventFrames);
    
    prob = zeros(numJoints, 1);
    
    sumEvents = sum(eventFrames, 1);
    prob = sumEvents/numFrames;
end