clear;

[s, m, f] = bvhReadFile('examples/05_13.bvh');

% probCOM = comMeasure(s, m);
probLocal = localMeasure(s, m);
weightLocal = computeLocalWeights(s, m);

entropyPoseLocal = poseEntropy_Local(probLocal, weightLocal);

eventsFrame = findConstraints(s, m);
probGlobal  = globalMeasure(eventsFrame);

entropyPoseGlobal = poseEntropy_Global(probGlobal, eventsFrame);

entropyPose = entropyPoseLocal + entropyPoseGlobal;

