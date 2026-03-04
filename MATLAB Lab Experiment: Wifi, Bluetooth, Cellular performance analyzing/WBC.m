clear all;
close all;
G_t = 1;
G_r = 1;
c = 3*1e8;
Pn = 500*1e-6; %noise power

G_t = 1;              % Transmitter antenna gain (linear)
G_r = 1;              % Receiver antenna gain (linear)
c = 3*1e8;            % Speed of light (m/s)
Pn = 500*1e-6;        % Noise power (Watts)

%Task 1: WIFI Simulation

f_wifi = 2.4*1e9; %IEEE 802.11b
BW_wifi = 22*1e6;
d_wifi = 1:5:100;
P_t_wifi = 100*1e-3;
lamb_wifi = c/f_wifi;

%Power
lambda_wifi = c / f_wifi;  % Wavelength
Pr_wifi = P_t_wifi * G_t * G_r .* ...
          (lambda_wifi ./ (4*pi*d_wifi)).^2;
Pr_wifi_dB = 10*log10(Pr_wifi);

%SINR
SINR_wifi = Pr_wifi ./ Pn;
SINR_wifi_dB = 10*log10(SINR_wifi)

%Channel capacity
Capacity_wifi = BW_wifi .* log2(1 + SINR_wifi);
Capacity_wifi_dB = 10*log10(Capacity_wifi);

%Task 2: Bluetooth Simulation

f_bluetooth = 2.45*1e9; %IEEE 802.11
BW_bluetooth = 2*1e6;
d_bluetooth = 0.5:0.5:10;
P_t_bluetooth = 10*1e-3;
lamb_bluetooth = c/f_bluetooth;

%Power
Pr_bluetooth = P_t_bluetooth*G_t*G_r .* ...
               (lamb_bluetooth./(4*pi*d_bluetooth)).^2;
Pr_bluetooth_dB = 10*log10(Pr_bluetooth);

%SINR
SINR_bluetooth = Pr_bluetooth/Pn;
SINR_bluetooth_dB = 10*log10(SINR_bluetooth);

%Channel capacity
Capacity_bluetooth = BW_bluetooth*log2(1+SINR_bluetooth);
Capacity_bluetooth_dB = 10*log10(Capacity_bluetooth);


%Task 3: Cellular Simulation

f_cellular = 850*1e6; %2G,GSM
BW_cellular = 200*1e3;
d_cellular = 100:100:5000;
P_t_cellular = 40;
lamb_cellular = c/f_cellular;

%Power
Pr_cellular = P_t_cellular*G_t*G_r .* ...
              (lamb_cellular./(4*pi*d_cellular)).^2;
Pr_cellular_dB = 10*log10(Pr_cellular);

%SINR
SINR_cellular = Pr_cellular/Pn;
SINR_cellular_dB = 10*log10(SINR_cellular);

%Channel capacity
Capacity_cellular = BW_cellular*log2(1+SINR_cellular);
Capacity_cellular_dB = 10*log10(Capacity_cellular);

% --------- WIFI Received Power Plot ---------
figure;
plot(d_wifi, Pr_wifi_dB, 'b', 'LineWidth', 2);
xlabel('Distance (m)');
ylabel('Received Power (dB)');
title('WiFi (2.4 GHz) - Received Power vs Distance');
grid on;
legend('Received Power');

% --------- WIFI SINR Plot ---------
figure;
plot(d_wifi, SINR_wifi_dB, 'r', 'LineWidth', 2);
xlabel('Distance (m)');
ylabel('SINR (dB)');
title('WiFi (2.4 GHz) - SINR vs Distance');
grid on;
legend('SINR');

% --------- WIFI Channel Capacity Plot ---------
figure;
plot(d_wifi, Capacity_wifi_dB, 'y', 'LineWidth', 2);
xlabel('Distance (m)');
ylabel('Channel Capacity (dB)');
title('WiFi (2.4 GHz) - Channel Capacity vs Distance');
grid on;
legend('Capacity');

% --------- Bluetooth Received Power Plot---------
figure;
plot(d_bluetooth, Pr_bluetooth_dB,'b','LineWidth',2);
title('Bluetooth - Received Power vs Distance');
xlabel('Distance (m)');
ylabel('Received Power (dB)');
grid on;

% --------- Bluetooth SINR Plot---------
figure;
plot(d_bluetooth, SINR_bluetooth_dB,'r','LineWidth',2);
title('Bluetooth - SINR vs Distance');
xlabel('Distance (m)');
ylabel('SINR (dB)');
grid on;

% --------- Bluetooth Channel Capacity Plot---------
figure;
plot(d_bluetooth, Capacity_bluetooth_dB,'y','LineWidth',2);
title('Bluetooth - Capacity vs Distance');
xlabel('Distance (m)');
ylabel('Capacity (dB)');
grid on;

% --------- Cellular Received Power Plot---------
figure;
plot(d_cellular, Pr_cellular_dB,'b','LineWidth',2);
title('Cellular (850 MHz) - Received Power vs Distance');
xlabel('Distance (m)');
ylabel('Received Power (dB)');
grid on;

% --------- Cellular SINR Plot---------
figure;
plot(d_cellular, SINR_cellular_dB,'r','LineWidth',2);
title('Cellular (850 MHz) - SINR vs Distance');
xlabel('Distance (m)');
ylabel('SINR (dB)');
grid on;

% --------- Cellular Channel Capacity Plot---------
figure;
plot(d_cellular, Capacity_cellular_dB,'y','LineWidth',2);
title('Cellular (850 MHz) - Capacity vs Distance');
xlabel('Distance (m)');
ylabel('Capacity (dB)');
grid on;


% ============================================================
% COMPARISON PLOTS (Overlay)
% ============================================================

% Received Power Comparison
figure;
plot(d_wifi, Pr_wifi_dB,'b','LineWidth',2); hold on;
plot(d_bluetooth, Pr_bluetooth_dB,'r','LineWidth',2);
plot(d_cellular, Pr_cellular_dB,'y','LineWidth',2);
title('Received Power Comparison');
xlabel('Distance (m)');
ylabel('Received Power (dB)');
legend('WiFi','Bluetooth','Cellular');
grid on;

% SINR Comparison
figure;
plot(d_wifi, SINR_wifi_dB,'b','LineWidth',2); hold on;
plot(d_bluetooth, SINR_bluetooth_dB,'r','LineWidth',2);
plot(d_cellular, SINR_cellular_dB,'y','LineWidth',2);
title('SINR Comparison');
xlabel('Distance (m)');
ylabel('SINR (dB)');
legend('WiFi','Bluetooth','Cellular');
grid on;

% Capacity Comparison
figure;
plot(d_wifi, Capacity_wifi_dB,'b','LineWidth',2); hold on;
plot(d_bluetooth, Capacity_bluetooth_dB,'r','LineWidth',2);
plot(d_cellular, Capacity_cellular_dB,'y','LineWidth',2);
title('Capacity Comparison');
xlabel('Distance (m)');
ylabel('Capacity (dB)');
legend('WiFi','Bluetooth','Cellular');
grid on;


%{
Observations & Discussion

1) Received Power Trends:

->All technologies show power decreasing with distance (∝ 1/d²).
->Cellular has higher received power at long distances because:
->Much higher transmit power (40 W)
->Lower frequency (850 MHz → larger wavelength → less path loss)

2️) SINR Trends:

->SINR decreases as distance increases.
->Cellular maintains usable SINR over kilometers.
->Bluetooth drops quickly due to:
->Very low transmit power (10 mW)
->Designed for short range

3️) Capacity Trends:

->Using Shannon's formula
->WiFi has the highest capacity
->Bluetooth has moderate capacity
->Cellular has lowest capacity but works over very long range

4) Final Conclusion:

Higher frequency -> more path loss

Higher bandwidth -> higher capacity

Higher transmit power -> longer range

}%