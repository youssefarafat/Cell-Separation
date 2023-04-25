
dirDAPI             = dir('*DAPI.tiff');
dirPhalloidin       = dir('*Phalloi*.tiff');



%%
k=1;

% Read DAPI channel
dataIn = imread(dirDAPI(k).name);

% segment nuclei from dapi
dataOut = cellseperationtest(dataIn);




% read phalloiding
dataIn1 = imread(dirPhalloidin(k).name);
% segment islands from phalloidin
dataOut2 = PhalloidinRBD(dataIn1);


imagesc(dataOut2.labeled_filt_islands*2+((dataOut.central_cells)>0))
%%
central_cells_D_P = central_cells;
islands_D_P = labeled_filt_islands;

% Calculate the combination
dataOut = Dapi_Phalloidin_combination(central_cells_D_P,islands_D_P);
%%

