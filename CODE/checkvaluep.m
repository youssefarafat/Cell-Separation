for k = 1:10
    %disp(k)
    disp(dir0(k).name)
    dataIn = imread(dir0(k).name);
    dataOut = cellseperationtest(dataIn);
    results(k,1) = dataOut.numCells;
    results(k,2) = mean([dataOut.central_props.Area]);
    results(k,3) = mean([dataOut.central_props.Centroid]);
    results(k,4) = mean([dataOut.central_props.Orientation]);
    results(k,5) = mean([dataOut.central_props.Solidity]);
    results(k,6) = mean([dataOut.central_props.MeanIntensity]);
    results(k,7) = mean([dataOut.central_props.MinIntensity]);
    results(k,8) = mean([dataOut.central_props.MaxIntensity]);
    results(k,9)= mean([dataOut.central_props.MaxFeretDiameter]);
    results(k,10) = mean([dataOut.central_props.MaxFeretAngle]);
    results(k,11) = std2([dataOut.central_props.Area]);
    results(k,12) = std2([dataOut.central_props.Centroid]);
    results(k,13) = std2([dataOut.central_props.Orientation]);
    results(k,14) = std2([dataOut.central_props.Solidity]);
    results(k,15) = std2([dataOut.central_props.MeanIntensity]);
    results(k,16) = std2([dataOut.central_props.MinIntensity]);
    results(k,17) = std2([dataOut.central_props.MaxIntensity]);
    results(k,18) = std2([dataOut.central_props.MaxFeretDiameter]);
    results(k,19) = std2([dataOut.central_props.MaxFeretAngle]);
end
%%
for k = 1:19
    disp(k)
    [t(k),p(k)]= ttest2(results(1:5,k),results(6:10,k));
end