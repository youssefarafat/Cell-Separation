%% Remove the scale bar at the bottom right and select the blue channel
img1 = imread('RBD_LKR13_1_DAPI.tif');
img1(980:end,810:end,:)=0;
blue_channel            = img1(:,:,3);
% filter and threshold to detect cells
blue_channel_filt       = imfilter(blue_channel,fspecial('Gaussian',5));
blue_channel_thres      = blue_channel_filt>90;
% label individual regions as cells, obtain properties
blue_channel_labelled   = bwlabel(blue_channel_thres);
blue_channel_props      = regionprops(blue_channel_labelled,'Area');
% separate the large cells and fill them im
[blue_channel_large,numCells]  = bwlabel(ismember(blue_channel_labelled,find([blue_channel_props.Area]>48)));
blue_channel_filled     = imfill(blue_channel_large);

% close the regions, but individually, otherwise they merge
cells_0                 = zeros(size(blue_channel));
for counterCells = 1:numCells
    cells_0             = cells_0 + counterCells*imclose(blue_channel_filled==counterCells,strel('disk',3));
end
%cells_0                 = imclose(blue_channel_filled,strel('disk',3));
%cells_1                 = imopen(cells_0,strel('disk',1));

%imagesc((cells_0))
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

% this assumes that there is only one case of 3 cells, for more there
% should be a loop or something different
if max(cells_3morecells(:)>0)
    cell_split              = imerode((watershed(1-imdilate(imerode(cells_3morecells,strel('line',cells_3morecells_props.MinorAxisLength+0,90-cells_3morecells_props.Orientation)),ones(15) ))),ones(3));
    cells_3morecells        = cells_3morecells.*(cell_split>0);
end
%figure
%imagesc(cells_single+2*cells_2cells+3*cells_3morecells)
%figure(2)
%imagesc(cells_0)
%imagesc(blue_channel.*uint8(blue_channel_filled>0))
%% labelling of cells
[all_cells,numCells]             = bwlabel(cells_single+cells_2cells+cells_3morecells);
all_cells_props                 = regionprops(all_cells,'Area','BoundingBox','Extrema');

%  1     Discard ANY cell that touches the border of the field of view
%how do I do this for all the cells?????
[rows,columns,channels] = size(img1);
cells_touch_1 = min([all_cells_props.Extrema])<1;
cells_touch_end = max([all_cells_props.Extrema])>(rows-0);
cells_touch_edge = cells_touch_1(1:2:end) +cells_touch_1(2:2:end)+...
    cells_touch_end(1:2:end)+cells_touch_end(2:2:end);

[central_cells,numCentral] = bwlabel(ismember(all_cells, find(cells_touch_edge==0)));



% 2 combine the edges of the final cells and add to the input image,  also
% add a number to each cell 
%boundaries = bwboundaries(all_cells);
%numberOfBoundaries = size(boundaries, 1);
%hold on;% Here is where we actually plot the boundaries of each blob in the overlay.
 % Don't let boundaries blow away the displayed image.
%for k = 1 : numberOfBoundaries
	%thisBoundary = boundaries{k}; % Get boundary for this specific blob.
	%x = thisBoundary(:,2); % Column 2 is the columns, which is x.
	%y = thisBoundary(:,1); % Column 1 is the rows, which is x.
	%plot (x, y, 'r', 'LineWidth', 2); % Plot boundary in red.
%end
%hold off
%all_cells_edge = edge(all_cells, 'canny')
%[r,c] = find(bwlabel(all_cells)==2)
%circles = viscircles(c, r)
%%
%boundaries = bwboundaries(all_cells);
%imshow(all_cells)
%hold on
%visboundaries(boundaries);
%imshow(all_cells); 
%hold on;
%colors=['b' 'g' 'r' 'c' 'm' 'y'];
%for k=1:length(boundaries)
 % boundary = boundaries{k};
 % cidx = mod(k,length(colors))+1;
 % plot(boundary(:,2), boundary(:,1),...
  %     colors(cidx),'LineWidth',2);

  %text(boundary(1,2),boundary(1,1),num2str(k) ,'Color','r', 'FontSize', 15);%end

  edges_cells = imdilate(edge(central_cells,'canny'),ones(3));

  overlaid_cells  = img1.* uint8(repmat(1- edges_cells,[1 1 3]));
  overlaid_cells(:,:,1) = edges_cells*255;

%%
% 3 Other characteristics that can be extracted?????Position, clusters,
% brightness, ??????
%[L,Centers] = imsegkmeans(uint8*all_cells,3);
%B = labeloverlay(uint8*all_cells,L);
%imshow(B)

%orientationprop = regionprops(all_cells, 'Orientation');
%upwardsorient  = ismember(all_cells,find([orientationprop.Orientation]>=0));
%downwardorient = ismember(all_cells,find([orientationprop.Orientation]<0));
%imshow(downwardorient)
%img1_brightness = imbinarize(blue_channel_filled)
%solidity_allcells = regionprops(all_cells, 'Solidity');
below_solidity  = ismember(all_cells,find([solidity_allcells.Solidity]< 0.9100));
imshow(below_solidity)
maxferet_prop = regionprops(all_cells,'MaxFeretProperties')
neangferet  = ismember(all_cells,find([maxferet_prop.MaxFeretAngle]<0));
imshow(neangferet);

below_diameter_feret = ismember(all_cells,find([maxferet_prop.MaxFeretDiameter]>60));
imshow(below_diameter_feret);
%pixel_intensity = imregionalmax(img1_brightness)









