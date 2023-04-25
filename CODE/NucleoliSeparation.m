imagetrial = imread('RBD_LKR13_1_DAPI.tif');
blueimage = imagetrial(:,:,3);
threshold = 200;
nucleoli = blueimage > threshold;
initial_label = bwlabel(nucleoli);
%fillingobj = imfill(nucleoli,"holes");
se = strel('disk',1);
erodeimage = imerode(nucleoli, se);
dilatedimage = imdilate(erodeimage, strel('diamond',3));
figure
imagesc(dilatedimage);
bwlabeln
