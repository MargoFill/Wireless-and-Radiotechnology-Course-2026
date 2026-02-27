%% Thermal Noise Simulation and PSD Analysis

clc;
clear;
close all;

%% Parameters
k = 1.38e-23;      % Boltzmann constant (J/K)
T = 300;           % Temperature (K)
R = 100;           % Resistance (Ohms)
B = 100;           % Bandwidth (Hz)

n_samples = 10000; % Number of samples
fs = B;            % Sampling frequency

%% Time Vector
time = (0:n_samples-1)/fs;

%% Thermal Noise Generation
Vrms = sqrt(4 * k * T * R * B);   % Theoretical RMS voltage
thermal_noise = Vrms * randn(1, n_samples);

%% Display RMS Comparison
measured_rms = rms(thermal_noise);

fprintf('Theoretical RMS Voltage: %e V\n', Vrms);
fprintf('Measured RMS Voltage:    %e V\n', measured_rms);

%% Time Domain Plot
figure;
plot(time, thermal_noise);
title('Thermal Noise in Time Domain');
xlabel('Time (s)');
ylabel('Voltage (V)');
grid on;

%% Power Spectral Density (PSD) using Welch Method
figure;
[psd, freq] = pwelch(thermal_noise, [], [], [], fs);

semilogx(freq, 10*log10(psd));
title('Power Spectral Density of Thermal Noise');
xlabel('Frequency (Hz)');
ylabel('PSD (dB/Hz)');
grid on;

%% Histogram to Verify Gaussian Distribution
figure;
histogram(thermal_noise, 50);
title('Histogram of Thermal Noise (Gaussian Check)');
xlabel('Voltage (V)');
ylabel('Count');
grid on;