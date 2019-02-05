clear
clc

% Variables
nx = 50; %number of rows
ny = 50; %number of columns
G = zeros(nx*ny, nx*ny);


iterations = 10000; %number of specified iterations

% Calculations
% boundary conditions for G
for z = 1:nx*ny
    G(z, z) = 1; % 2.a.i
    G(z, :) = 0; % 2.a.i
end

% for "bulk nodes"
% 
% end


figure(1)
clf
subplot(2, 2, 1)
spy(G); % 2.a.iv
title('G Matrix');
xlabel('nx'); ylabel('ny');
grid on;

[E, D] = eigs(g, 9, 'SM'); % 2.a.v
subplot(2, 2, 2)
plot(nx, D); % 2.a.vi
title('Eigenvalues');
grid on;

% convert diagonal matrix to square matrix which fills up (1,1),(1,2),(1,3), etc
new_E = zeros(nx, ny);
counter = 1;
for z = 1:nx
    for p = 1:ny
        new_E(z, p) = E(counter, counter); 
        counter = counter + 1;
    end
end

subplot(2, 2, 3)
surf(E); % 2.a.vii
title('Eigenvectors');


