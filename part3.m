% Competition: Identifying the Objects
% Initial Approach: Under-Propagation for Separation before Convergence

load('lightField.mat');
width = 0.015;
pixels = 800;
f = 0.23; % re-tune for under-propagation
d1 = 0.44; % re-tune for under-propagation

[img_separated, d2] = propagate(rays, width, pixels, f, d1);

imshow(flip(img_separated, 2));
title("Under-Propagation with d1 = " + d1 + " m, f = " + f + ...
    " m, and d2 = " + d2 + " m");
exportgraphics(gca, 'separated.png');

%%
% Optimal Approach: k-means Clustering of Rays for Clearer Images

indices = kmeans(rays', 3); % k = 3
rays1 = rays(:, indices == 1);
rays2 = rays(:, indices == 2);
rays3 = rays(:, indices == 3);

f = 0.25; % revert back to original value as Part 2
d1 = 0.4; % revert back to original value as Part 2

img_separated1 = propagate(rays1, width, pixels, f, d1);
img_separated2 = propagate(rays2, width, pixels, f, d1);
img_separated3 = propagate(rays3, width, pixels, f, d1);

figure;
imshow(flip(img_separated1, 2));
title("k-means Clustered Image 1 from lightField.mat");
exportgraphics(gca, 'separated1.png');
figure;
imshow(flip(img_separated2, 2));
title("k-means Clustered Image 2 from lightField.mat");
exportgraphics(gca, 'separated2.png');
figure;
imshow(flip(img_separated3, 2));
title("k-means Clustered Image 3 from lightField.mat");
exportgraphics(gca, 'separated3.png');