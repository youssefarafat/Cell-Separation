function dataOut = cellseperationtest(dataIn)
%% Remove the scale bar at the bottom right and select the blue channel
dataIn = dataIn;
[rows,cols,channels] = size(dataIn);
dataIn = imread("RBD_LKR13_1_DAPI.tiff");
dataIn(980:end,810:end,:)=0;
blue_channel            = dataIn(:,:,3);
% filter and threshold to detect cells
blue_channel_filt       = imfilter(blue_channel,fspecial('Gaussian',5));
blue_channel_thres      = blue_channel_filt> 255*graythresh(blue_channel_filt);
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
[rows,columns,channels] = size(dataIn);
cells_touch_1 = min([all_cells_props.Extrema])<1;
cells_touch_end = max([all_cells_props.Extrema])>(rows-0);
cells_touch_edge = cells_touch_1(1:2:end) +cells_touch_1(2:2:end)+...
    cells_touch_end(1:2:end)+cells_touch_end(2:2:end);

[central_cells,numCentral] = bwlabel(ismember(all_cells, find(cells_touch_edge==0)));

central_cells_props     = regionprops(central_cells,blue_channel,'area','centroid','orientation','Solidity','MaxFeretProperties','MaxIntensity','MeanIntensity','MinIntensity');

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

  edges_cells = imdilate(edge(central_cells > 0 ,'canny'),ones(3));

  overlaid_cells  = dataIn.* uint8(repmat(1- edges_cells,[1 1 3]));
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
%dataIn_brightness = imbinarize(blue_channel_filled)
%solidity_allcells = regionprops(all_cells, 'Solidity');
%below_solidity  = ismember(all_cells,find([solidity_allcells.Solidity]< 0.9100));
%imshow(below_solidity)
maxferet_prop = regionprops(all_cells,'MaxFeretProperties');
neangferet  = ismember(all_cells,find([maxferet_prop.MaxFeretAngle]<0));
%imshow(neangferet);

below_diameter_feret = ismember(all_cells,find([maxferet_prop.MaxFeretDiameter]>60));
%imshow(below_diameter_feret);
%pixel_intensity = imregionalmax(dataIn_brightness)


%%
positions               =[central_cells_props.Centroid];
x                       = positions(1:2:end);
y                       = positions(2:2:end);
numCentroids            = numel(x);
%whos
DT                      = (delaunay(x,y));

numTriangles            = size(DT,1);
%DT3 = delaunayTriangulation(x',y');
%imagesc(overlaid_cells)

%hold on
%triplot(DT,x,y);
%for k=1:numTriangles
   % DTarea            = polyarea(x(DT(k,:)),y(DT(k,:)));
%end

%[vx,vy]=voronoi(x,y);

dataOut.final_cells     = all_cells;
dataOut.numCells        = numCells;
dataOut.overlaid        = overlaid_cells;
dataOut.central_cells   = central_cells;
dataOut.numCentral      = numCentral;
dataOut.central_props   = central_cells_props;
dataOut.centroids       =[x' y'];
end

%for k = 1:9
%dataIn = imread(dir0(k).name);
%dataOut = cellseperationtest(dataIn);
%figure(k)
%imagesc(dataOut.overlaid)
%end

%for k = 1:10
%dataIn = imread(dir0(k).name);
%dataOut = cellseperationtest(dataIn);
%figure(3)
%subplot(2,5,k)
%imagesc(dataOut.overlaid)
%end


%dir0 = dir('*DAPI.tiff')
%numFiles            = numel(dir0);
%figure(10)
%for k =1:numFiles
  %  subplot(2,5,k)
    
    %imagesc(imread(strcat(filesep,dir0(k).name)))
    %ylabel(dir0(k).name,'interpreter','none')
%end

%for k =1:9
%dataIn = imread(dir0(k).name);
%dataOut = cellseperationtest(dataIn);
%results(k) = dataOut.numCells;
%end

%dir0 = dir('*DAPI.tiff')

%for k =1:9
%dataIn = imread(dir0(k).name);
%dataOut = cellseperationtest(dataIn);
%results(k) = dataOut.numCells;
%end

%for k = 1:9
%dataIn = imread(dir0(k).name);
%dataOut = cellseperationtest(dataIn);
%figure(k)
%imagesc(dataOut.overlaid)
%end

%mean([dataOut.central_props.Area])
%%
% dir0 = dir('*DAPI.tiff');
% for k = 1:10;
% dataIn = imread(dir0(k).name);
% dataOut = cellseperationtest(dataIn);
% results(k,1) = dataOut.numCells;
% results(k,2) = mean([dataOut.central_props.Area]);
% results(k,3) = mean([dataOut.central_props.Centroid]);
% results(k,4) = mean([dataOut.central_props.Orientation]);
% results(k,5) = mean([dataOut.central_props.Solidity]);
% results(k,6) = mean([dataOut.central_props.MeanIntensity]);
% results(k,7) = mean([dataOut.central_props.MinIntensity]);
% results(k,8) = mean([dataOut.central_props.MaxIntensity]);
% results(k,9)= mean([dataOut.central_props.MaxFeretDiameter]);
% results(k,10) = mean([dataOut.central_props.MaxFeretAngle]);
% results(k,11) = std2([dataOut.central_props.Area]);
% results(k,12) = std2([dataOut.central_props.Centroid]);
% results(k,13) = std2([dataOut.central_props.Orientation]);
% results(k,14) = std2([dataOut.central_props.Solidity]);
% results(k,15) = std2([dataOut.central_props.MeanIntensity]);
% results(k,16) = std2([dataOut.central_props.MinIntensity]);
% results(k,17) = std2([dataOut.central_props.MaxIntensity]);
% results(k,18) = std2([dataOut.central_props.MaxFeretDiameter]);
% results(k,19) = std2([dataOut.central_props.MaxFeretAngle]);
% end
% 
% for k = 1:19
% [t(k),p(k),r(k)]= ttest2(results(1:5,k),results(6:10,k);
% end
% 
% %%
% % [t,p,r] = ttest2(results([1:5,2]),results([6:10,2]))
% % 
% % %results1 = rand(10,2);
% % 
% % [t1,p1,r1] = ttest2(results([1:5,3]),results([6:10,3]))
% % %[t1,p1,r1] = ttest2(results([1:5,3]),0.5+results([6:10,3]))
% % 
% % 
% % %results2 = rand(10,2);
% % [t2,p2,r2] = ttest2(results([1:5,4]),results([6:10,4]))
% % %[t2,p2,r2] = ttest2(results([1:5,4]),0.5+results([6:10,4]))
% % 
% % %results3 = rand(10,2);
% % [t3,p3,r3] = ttest2(results([1:5,5]),results([6:10,5]))
% % %[t3,p3,r3] = ttest2(results([1:5,5]),0.5+results([6:10,5]))
% % 
% % %results4 = rand(10,2);
% % [t4,p4,r4] = ttest2(results([1:5,6]),results([6:10,6]))
% % %[t4,p4,r4] = ttest2(results([1:5,6]),0.5+results([6:10,6]))
% % 
% % %results5 = rand(10,2);
% % [t5,p5,r5] = ttest2(results([1:5,7]),results([6:10,7]))
% % %[t5,p5,r5] = ttest2(results([1:5,7]),0.5+results([6:10,7]))
% % 
% % %results6 = rand(10,2);
% % [t6,p6,r6] = ttest2(results([1:5,8]),results([6:10,8]))
% % %[t6,p6,r6] = ttest2(results([1:5,8]),0.5+results([6:10,8]))
% % 
% % 
% % %results7 = rand(10,2);
% % [t7,p7,r7] = ttest2(results([1:5,9]),results([6:10,9]))
% % %[t7,p7,r7] = ttest2(results([1:5,9]),0.5+results([6:10,9]))
% % 
% % %results8 = rand(10,2);
% % [t8,p8,r8] = ttest2(results([1:5,10]),results([6:10,10]))%
% % %[t8,p8,r8] = ttest2(results([1:5,10]),0.5+results([6:10,10]))
% % 
% % %results9 = rand(10,2);
% % [t9,p9,r9] = ttest2(results([1:5,11]),results([6:10,11]))
% % %[t9,p9,r9] = ttest2(results([1:5,11]),0.5+results([6:10,11]))
% % 
% % %results10 = rand(10,2);
% % [t10,p10,r10] = ttest2(results([1:5,12]),results([6:10,12]))
% % %[t10,p10,r10] = ttest2(results([1:5,12]),0.5+results([6:10,12]))
% % 
% % %results11 = rand(10,2);
% % [t11,p11,r11] = ttest2(results([1:5,13]),results([6:10,13]))
% % %[t11,p11,r11] = ttest2(results([1:5,13]),0.5+results([6:10,13]))
% % 
% % %results12 = rand(10,2);
% % [t12,p12,r12] = ttest2(results([1:5,14]),results([6:10,14]))
% % %[t12,p12,r12] = ttest2(results([1:5,14]),0.5+results([6:10,14]))
% % 
% % %results13 = rand(10,2);
% % [t13,p13,r13] = ttest2(results([1:5,15]),results([6:10,15]))
% % %[t13,p13,r13] = ttest2(results([1:5,15]),0.5+results([6:10,15]))
% % 
% % %results14 = rand(10,2);
% % [t14,p14,r14] = ttest2(results([1:5,16]),results([6:10,16]))
% % %[t14,p14,r14] = ttest2(results([1:5,16]),0.5+results([6:10,16]))
% % 
% % %results15 = rand(10,2);
% % [t15,p15,r15] = ttest2(results([1:5,17]),results([6:10,17]))
% % %[t15,p15,r15] = ttest2(results([1:5,17]),0.5+results([6:10,17]))
% % 
% % %results16 = rand(10,2);
% % [t16,p16,r16] = ttest2(results([1:5,18]),results([6:10,18]))
% % %[t16,p16,r16] = ttest2(results([1:5,18]),0.5+results([6:10,18]))
% % 
% % %results17 = rand(10,2);
% % [t17,p17,r17] = ttest2(results([1:5,19]),results([6:10,19]))
% %[t17,p17,r17] = ttest2(results([1:5,19]),0.5+results([6:10,19]))
% 
% 
