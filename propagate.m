function [img, d2] = propagate(width, pixels, f, d1)
% in order to maximize programming efficiency, we decided to write a
% function to simulate the propagation of rays in lightField.mat, which
% will be called in both Parts 2 and 3
load('lightField.mat');
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

rays_out1 = Mf * rays;
rays_in2 = rays_out1;
rays_out2 = Md2 * rays_in2;
img = rays2img(rays_out2(1, :), rays_out2(3, :), width, pixels);
end