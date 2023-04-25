h0=figure;
dapiIn = imread("RBD_LKR13_1_DAPI.tiff");
dapiIn(980:end,810:end,:)=0;
blue_channel            = dapiIn(:,:,3);
thresh_dapi = graythresh(blue_channel);
otsu_dapi = imbinarize(blue_channel,thresh_dapi);
label_dapi = bwlabel(otsu_dapi);

rr=1:400;
cc=1:400;
subplot(121)
imagesc(dapiIn(rr,cc,:))
subplot(122)
 imagesc( label_dapi(rr,cc))
 colormap jet
h0.Position = [ 100   400   900   300];

filename2='Dapi_labeled.png';
print('-dpng','-r200',filename2)
 
 %%

h1 = figure
phalloidinIn = imread("RBD_LKR13_1_Phalloidin.tif");
phalloidinIn(980:end,810:end,:)=0;
red_channelR = phalloidinIn(:,:,1);
thresh_phallo = 1.5*graythresh(red_channelR);
otsu_phallo = imbinarize(red_channelR, thresh_phallo);
label_phallo = bwlabel(otsu_phallo);
rr=200:800;
cc=200:800;
subplot(121)
imagesc(phalloidinIn(rr,cc,:))
subplot(122)
 imagesc( label_phallo(rr,cc))
 colormap jet
h1.Position = [ 100   400   900   300];

filename1='Phalloidin_labelled.png';
print('-dpng','-r200',filename1)
