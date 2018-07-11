clear all;
close all;
k = (75-27)/ (200^2)

% dT = linspace(0, 75, 1000);
% 
% i = sqrt(dT/k);
% 
% figure
% plot(dT,i)
% ylabel('current (A)')
% xlabel('temperature difference (C)')
% grid on

Tj = 75;
Ta = linspace(-60,75, 1000);

k1 = (75-27)/ (200^2);
i1 = sqrt((Tj-Ta)/k1);
k2 = (75-27)/ (250^2);
i2 = sqrt((Tj-Ta)/k2);
k3 = (75-27)/ (300^2);
i3 = sqrt((Tj-Ta)/k3);

figure
hold on
plot(Ta,i1)
plot(Ta,i2)
plot(Ta,i3)
title('Current Deratings (Tj = 75 C)')
ylabel('Minimum Current (A)')
xlabel('Ambient Temperature (C)')
legend(sprintf('200 A @ 27 C, H=%f', k1),
       sprintf('250 A @ 27 C, H=%f', k2),
       sprintf('300 A @ 27 C, H=%f', k3)
)
grid on

print -dpng deratings.png
