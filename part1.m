% Case Study 3 Lab Exercise
% Distance = meters; Degrees = radians

d = 0.2; % 0.2 m or 200 mm
s = -pi / 20;
a = pi / 80;

rays_in = [0,       0,      0,      0,      0,      0,      0,      0;
           s+a,     s+2*a,  s+3*a,  s+4*a,  s+5*a,  s+6*a,  s+7*a, s+8*a;
           0,       0,      0,      0,      0,      0,      0,      0;
           0,       0,      0,      0,      0,      0,      0,      0];

M = [1,     d,      0,      0;
     0,     1,      0,      0;
     0,     0,      1,      d;
     0,     0,      0,      1];

rays_out = M * rays_in;
ray_z = [zeros(1, size(rays_in, 2)); d * ones(1, size(rays_in, 2))];

plot(ray_z, [rays_in(1, :); rays_out(1, :)], 'Color', 'blue', ...
    'LineWidth', 2);