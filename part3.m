% Competition: Identifying the Objects

load('lightField.mat');
width = 0.015;
pixels = 800;
f = 0.23;
d1 = 0.44;
d2 = 1 / (1 / f - 1 / d1);

Md1 = [1,     d1,     0,      0;
       0,     1,      0,      0;
       0,     0,      1,      d1;
       0,     0,      0,      1];

Md2 = [1,     d2,     0,      0;
       0,     1,      0,      0;
       0,     0,      1,      d2;
       0,     0,      0,      1];

Mf = [1,    0,      0,      0;
      -1/f, 1,      0,      0;
      0,    0,      1,      0;
      0,    0,      -1/f,   1];

rays_out2 = Mf * rays;
rays_in3 = rays_out2;
rays_out3 = Md2 * rays_in3;
[img3, x3, y3] = rays2img(rays_out3(1, :), rays_out3(3, :), width, pixels);
figure;
imshow(flip(img3, 2));
title("Object Identification via Under-Propagation");
% exportgraphics(gca, 'light_field_clear.png');