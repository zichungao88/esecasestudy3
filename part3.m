% Competition: Identifying the Objects

width = 0.015;
pixels = 800;
f = 0.23; % tuned for under-propagation
d1 = 0.44; % tuned for under-propagation

[img_separated, d2] = propagate(width, pixels, f, d1);
figure;
imshow(flip(img_separated, 2));
title("Under-Propagation with d1 = " + d1 + " m, f = " + f + ...
    " m, and d2 = " + d2 + " m");
% exportgraphics(gca, 'light_field_separated.png');