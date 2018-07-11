clear all;
close all;

Tj = 75;
Ta = 27;
H = linspace(0.0003, 0.0040, 1000);

i = sqrt((Tj - Ta) ./ H);


figure
plot(H, i)
title('Current vs. Heating Factor')
ylabel('Current (A)')
xlabel('Heating Factor')
grid on

print -dpng currentheating.png
