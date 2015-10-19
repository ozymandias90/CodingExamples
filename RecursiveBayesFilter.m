% 1D Recursive Bayes
clear;
% detect the center of a beacon that emits signals, but the signals appear
% to be coming from different points than the actual beacon. Assume that
% these points are distributed according to a random distribution

% center of beacon
x0 = 1;
% generate rand distribution centered on 2, std of 3
N = 10000;

x  = x0+3*randn(N);

% start with a uniform Prior
gridx = -5:0.01:5;

Pr = ones(1,length(gridx));
Po = Pr;
p = zeros(1,length(gridx));

varx = 3^2;
% figure(1);clf;hold on;
xest = zeros(1,N);
for i=1:N;
    Pr=Po;
    xloc = x(i);
    p=0;
    for j=1:length(gridx)
        p(j) = 1/(2*pi*sqrt(varx)) * exp(-0.5*(xloc-gridx(j))^2/(varx));
        p(j) = p(j)*Pr(j);
    end
    
    Po = p./sum(p);
%     plot(gridx,Po);
    xind =  find(Po == max(Po));
    xest(i) = gridx(xind);
end

figure(2);
plot(xest);

