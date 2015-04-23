clear;

[s, m, f] = bvhReadFile('examples/05_13.bvh');

% probCOM = comMeasure(s, m);
probLocal = localMeasure(s, m);
weightLocal = computeLocalWeights(s, m);

probGlobal = globalMeasure(s, m);

% weightsCOM = 1;
weightsGlobal = 1;

probRoughSum = [probLocal probGlobal] * [weightsLocal' weightsGlobal]';


% probRoughSum = [probCOM probLocal probGlobal] * [weightsCOM weightsLocal' weightsGlobal]';
