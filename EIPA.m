clear
clc

% Variables
nx = 50; %number of rows
ny = 50; %number of columns
hb = 1.054571596e-34;
G = zeros(nx*ny, nx*ny);
m_0 = 9.11e-31; %mass of electrons

l = 1e-9;
x = linspace(0, l, nx);
dx = x(2)-x(1);
dx2 = dx*dx;

% iterations = 10000; %number of specified iterations

% Calculations
alpha = (hb^2) / (2 * m_0);
fn = @(i, j) j + (i-1)*ny;

for w = 1:nx % x
    for s = 1:nx % y
%         G(1, 1) = 1;
%         G(nx, 1) = 1;
        n = fn(w, s);
        nxm = fn(w-1, s);
        nxp = fn(w+1, s);
        nym = fn(w, s-1);
        nyp = fn(w, s+1);
        if w == 1
            G(n, n) = 1;
        elseif w == nx
            G(n, n) = 1;
        elseif s == 1
            G(n, n) = 1;
        elseif s == ny
            G(n, n) = 1;
        elseif w > 10 && w < 20 && s > 10 && s < 20
            G(n, n) = -2;
        else
            G(n, n) = -4;
            G(n, nxp) = 1;
            G(n, nxm) = 1;
            G(n, nyp) = 1;
            G(n, nym) = 1;            
        end
    end
end

figure(1)
clf
subplot(2, 2, 1)
spy(G); % 2.a.iv
title('G Matrix');
xlabel('nx'); ylabel('ny');
grid on;

[E, D] = eigs(G, 9, 'SM'); % 2.a.v
subplot(2, 2, 2)
plot(D); % 2.a.vi
title('Eigenvalues');
grid on;

for w = 1:nx % x
    for s = 1:nx % y
        n = fn(w, s);
        plot1(w, s) = E(n, 1);
        plot2(w, s) = E(n, 2);
        plot3(w, s) = E(n, 3);
        plot4(w, s) = E(n, 4);
        plot5(w, s) = E(n, 5);
        plot6(w, s) = E(n, 6);
        plot7(w, s) = E(n, 7);
        plot8(w, s) = E(n, 8);
        plot9(w, s) = E(n, 9);
    end
end

figure(2)

subplot(3, 3,1)
surf(plot1);
hold on;

subplot(3, 3,2)
surf(plot2);
hold on;

subplot(3, 3,3)
surf(plot3);
hold on;

subplot(3, 3,4)
surf(plot4);
hold on;

subplot(3, 3,5)
surf(plot5);
hold on;

subplot(3, 3,6)
surf(plot6);
hold on;

subplot(3, 3,7)
surf(plot7);
hold on;

subplot(3, 3,8)
surf(plot8);
hold on;

subplot(3, 3,9)
surf(plot9);
hold on;

% changing nx = 50 and ny = 51 gave an error due to eigs requiring a square
% matrix as an input



