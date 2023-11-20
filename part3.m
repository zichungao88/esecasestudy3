% Competition: Identifying the Objects
% Approach: k-means clustering of rays for clearer images

load('lightField.mat');

indices = kmeans(rays', 3); % k = 3
rays1 = rays(:, indices == 1);
rays2 = rays(:, indices == 2);
rays3 = rays(:, indices == 3);

width = 0.015;
pixels = 800;
f = 0.25;
d1 = 0.4;

img_separated1 = propagate(rays1, width, pixels, f, d1);
img_separated2 = propagate(rays2, width, pixels, f, d1);
img_separated3 = propagate(rays3, width, pixels, f, d1);

figure;
imshow(flip(img_separated1, 2));
title("Image 1 from lightField.mat");
exportgraphics(gca, 'separated1.png');
figure;
imshow(flip(img_separated2, 2));
title("Image 2 from lightField.mat");
exportgraphics(gca, 'separated2.png');
figure;
imshow(flip(img_separated3, 2));
title("Image 3 from lightField.mat");
exportgraphics(gca, 'separated3.png');