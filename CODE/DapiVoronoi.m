%%Voronoi & Delaunay

h0 = figure
subplot(122)
dapiIn = imread("RBD_LKR13_1_DAPI.tiff");
dapiIn(980:end,810:end,:)=0;
blue_channel            = dapiIn(:,:,3);
thresh_dapi = graythresh(blue_channel);
otsu_dapi = imbinarize(blue_channel,thresh_dapi);
label_dapi = bwlabel(otsu_dapi);
dapi_props = regionprops(label_dapi,'Centroid')
positions               =[dapi_props.Centroid];
x                       = positions(1:2:end);
y                       = positions(2:2:end);
numCentroids            = numel(x);
%whos
DT                      = (delaunay(x,y));

numTriangles            = size(DT,1);
DT3 = delaunayTriangulation(x',y');
imagesc(label_dapi(rr,cc,:))
hold on
triplot(DT,x,y);
colormap gray
rr=300:500;
cc=300:500;
subplot(121)
imagesc(blue_channel(rr,cc,:))
 
h0.Position = [ 100   400   900   300];

filename1='Dapi_Voronoi.png';
print('-dpng','-r200',filename1)


%%

figure
phalloidinIn = imread("RBD_LKR13_1_Phalloidin.tif");
phalloidinIn(980:end,810:end,:)=0;
red_channelR = phalloidinIn(:,:,1);
thresh_phallo = graythresh(red_channelR);
otsu_phallo = imbinarize(red_channelR, thresh_phallo);
label_phallo = 1-bwlabel(otsu_phallo);
phallo_show = imshowpair(phalloidinIn, label_phallo, 'montage')
 colormap jet