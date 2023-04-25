h0 = figure

subplot(131)
rng default
x = rand([1 3]);
y = rand([1 3]);
voronoi(x,y)
axis equal

DT1                     = (delaunay(x,y));
numTriangles            = size(DT1,1);
hold on
triplot(DT1,x,y);


subplot(132)
rng default
x = rand([1 10]);
y = rand([1 10]);
voronoi(x,y)
axis equal

DT2                     = (delaunay(x,y));
numTriangles            = size(DT2,1);
hold on
triplot(DT2,x,y);


subplot(133)
rng default
x = rand([1 50]);
y = rand([1 50]);
voronoi(x,y)
axis equal
DT3                     = (delaunay(x,y));
numTriangles            = size(DT3,1);
hold on
triplot(DT3,x,y);

h0.Position = [ 100   400   900   300];

filename11='Delaunay_Voronoi.png';
print('-dpng','-r200',filename11)

