%% Remove the scale bar at the bottom right and select the blue channel
img4 = imread('WT_LKR13_1_DAPI.tif');
blue2_channel            = img4(:,:,3);
% filter and threshold to detect cells
blue2_channel_filt       = imfilter(blue2_channel,fspecial('Gaussian',5));
blue2_channel_thres      = blue2_channel_filt>90;
% label individual regions as cells, obtain properties
blue2_channel_labelled   = bwlabel(blue2_channel_thres);
blue2_channel_props      = regionprops(blue2_channel_labelled,'Area');
% separate the large cells and fill them im
[blue2_channel_large,numCells]  = bwlabel(ismember(blue2_channel_labelled,find([blue2_channel_props.Area]>48)));
blue2_channel_filled     = imfill(blue2_channel_large);

% close the regions, but individually, otherwise they merge
cells_0                 = zeros(size(blue2_channel));
for counterCells = 1:numCells
    cells_0             = cells_0 + counterCells*imclose(blue2_channel_filled==counterCells,strel('disk',3));
end

%% selection of large/small and circular to detect merged cells
thres_large             = 2000;
thres_circularity       = 0.7;
cells_0_props           = regionprops(cells_0,'Area','Centroid','circularity');
% cells_0_large           = ismember(cells_0,find([cells_0_props.Area]>thres_large));
% cells_0_small           = ismember(cells_0,find([cells_0_props.Area]<=thres_large));
cells_single            = ismember(cells_0,find([cells_0_props.Circularity]>thres_circularity));
cells_merged            = bwlabel(ismember(cells_0,find([cells_0_props.Circularity]<=thres_circularity)));

cells_single_props           = regionprops(cells_single,'Area','Centroid','circularity','orientation');
cells_merged_props           = regionprops(cells_merged,'Area','Centroid','circularity','orientation');
cells_2cells            = ismember(cells_merged,find([cells_merged_props.Area]<4000));
cells_3morecells        = ismember(cells_merged,find([cells_merged_props.Area]>=4000));
cells_3morecells_props  = regionprops(cells_3morecells,'Area','Centroid','circularity','orientation','MajoraxisLength','MinoraxisLength','Image','ConvexImage','Extrema','BoundingBox');

cell_split              = imerode(watershed(1-(bwdist(1-cells_2cells)>11))>0,ones(6));
cells_2cells            = cells_2cells.*cell_split;

%%
%% labelling of cells
[all_cells,numCells]             = bwlabel(cells_single+cells_2cells);
all_cells_props                 = regionprops(all_cells,'Area','BoundingBox','Extrema');