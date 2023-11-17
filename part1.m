% Case Study 3 Lab Exercise
% Distance = meters; Angle = radians

% Ray Propagation in Free Space

n = 20; % # of rays
d = 0.2; % 0.2 m or 200 mm
s = -pi / 20;
a = (pi / 20 - s) / 9;
angles = linspace(-pi / 20, pi / 20, n);

rays_in1 = nan(4, n); % starting point: (0, 0, 0)
for i = 1:4
    if i == 2
        rays_in1(i, :) = angles;
    else
        rays_in1(i, :) = zeros;
    end
end

rays_in2 = nan(4, n); % starting point: (0.01, 0, 0)
for i = 1:4
    if i == 1
        rays_in2(i, :) = zeros + 0.01;
    elseif i == 2
        rays_in2(i, :) = angles;
    else
        rays_in2(i, :) = zeros;
    end
end

Md = [1,     d,      0,      0;
      0,     1,      0,      0;
      0,     0,      1,      d;
      0,     0,      0,      1];

rays_out1 = Md * rays_in1;
ray_z1 = [zeros(1, size(rays_in1, 2)); d * ones(1, size(rays_in1, 2))];

rays_out2 = Md * rays_in2;
ray_z2 = [zeros(1, size(rays_in2, 2)); d * ones(1, size(rays_in2, 2))];

hold on;
plot(ray_z1, [rays_in1(1, :); rays_out1(1, :)], 'Color', 'blue', ...
    'LineWidth', 2);
plot(ray_z2, [rays_in2(1, :); rays_out2(1, :)], 'Color', 'red', ...
    'LineWidth', 2);
hold off;
title('Ray Propagation in Free Space');
xlabel('z (m)');
ylabel('x (m)');

%%
% Ray Propagation through Lenses

f = 0.15; % 0.15 m or 150 mm
r = 0.02;
d1 = 0.2;
d2 = 0.8;

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
      0,    0,      -1/f,   0];

% Md2 * (Mf * (Md1 * rays_in))
rays_in1a = rays_in1; % (0, 0, 0)
rays_out1a = Md1 * rays_in1a; % pre-lense phase
rays_z1a = [zeros(1, size(rays_in1a, 2)); d1 * ones(1, ...
    size(rays_in1a, 2))];
rays_in1b = [];
for i = 1:n % only keep rays that hit the lense
    if abs(rays_out1a(1, i)) <= r
        rays_in1b = [rays_in1b, rays_out1a(:, i)];
    end
end
rays_out1b = Mf * rays_in1b; % passing through the lense
rays_in1c = rays_out1b;
rays_out1c = Md2 * rays_in1c; % post-lense phase
rays_z1c = [zeros(1, size(rays_in1c, 2)); d2 * ones(1, ...
    size(rays_in1c, 2))];

rays_in2a = rays_in2; % (0.01, 0, 0)
rays_out2a = Md1 * rays_in2a;
rays_z2a = [zeros(1, size(rays_in2a, 2)); d1 * ones(1, ...
    size(rays_in2a, 2))];
rays_in2b = [];
for i = 1:n
    if abs(rays_out2a(1, i)) <= r
        rays_in2b = [rays_in2b, rays_out2a(:, i)];
    end
end
rays_out2b = Mf * rays_in2b;
rays_in2c = rays_out2b;
rays_out2c = Md2 * rays_in2c;
rays_z2c = [zeros(1, size(rays_in2c, 2)); d2 * ones(1, ...
    size(rays_in2c, 2))];

figure;
hold on;
plot(rays_z1a, [rays_in1a(1, :); rays_out1a(1, :)], 'Color', 'blue', ...
    'LineWidth', 2);
plot(d1 + rays_z1c, [rays_in1c(1, :); rays_out1c(1, :)], 'Color', ...
    'blue', 'LineWidth', 2);
plot(rays_z2a, [rays_in2a(1, :); rays_out2a(1, :)], 'Color', 'red', ...
    'LineWidth', 2);
plot(d1 + rays_z2c, [rays_in2c(1, :); rays_out2c(1, :)], 'Color', ...
    'red', 'LineWidth', 2);
hold off;
title('Ray Propagation through Lenses');
xlabel('z (m)');
ylabel('x (m)');