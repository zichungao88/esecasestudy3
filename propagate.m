function [img, d2] = propagate(rays, width, pixels, f, d1)
% in order to maximize programming efficiency, we decided to write a
% function to simulate the propagation of rays in lightField.mat, which
% will be called in both Parts 2 and 3
d2 = 1 / (1 / f - 1 / d1);

Md2 = [1,     d2,     0,      0;
       0,     1,      0,      0;
       0,     0,      1,      d2;
       0,     0,      0,      1];

Mf = [1,    0,      0,      0;
      -1/f, 1,      0,      0;
      0,    0,      1,      0;
      0,    0,      -1/f,   1];

% "one line of code to draw any number of rays (line segments) between any 
% arbitrary number of locations"
rays_out = Md2 * Mf * rays;
img = rays2img(rays_out(1, :), rays_out(3, :), width, pixels);
end