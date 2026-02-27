%% Adding and Removing Noise from a Signal

clc;
clear;
close all;

%% Parameters
fs = 1000;              % Sampling frequency (Hz)
t = 0:1/fs:1;           % Time vector (1 second)
f_signal = 5;           % Signal frequency (Hz)
amplitude = 1;          % Signal amplitude
noise_std = 0.5;        % Noise standard deviation (adjustable)
cutoff_frequency = 10;  % Low-pass filter cutoff frequency (Hz)
filter_order = 4;       % Butterworth filter order

%% Generate Original Sinusoidal Signal
original_signal = amplitude * sin(2*pi*f_signal*t);

%% Add Gaussian White Noise
noise = noise_std * randn(size(t));
noisy_signal = original_signal + noise;

%% Plot Original and Noisy Signals
figure;
subplot(2,1,1);
plot(t, original_signal, 'b');
title('Original Sinusoidal Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

subplot(2,1,2);
plot(t, noisy_signal, 'r');
title('Noisy Signal (With Gaussian White Noise)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Design Low-pass Butterworth Filter
Wn = cutoff_frequency / (fs/2);   % Normalized cutoff frequency
[b, a] = butter(filter_order, Wn, 'low');

%% Apply Filter
filtered_signal = filtfilt(b, a, noisy_signal);  % Zero-phase filtering

%% Plot Filtered Signal
figure;
plot(t, noisy_signal, 'r');
hold on;
plot(t, filtered_signal, 'k', 'LineWidth', 1.5);
legend('Noisy Signal', 'Filtered Signal');
title('Noise Removal using Low-pass Butterworth Filter');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Plot Comparison of All Signals
figure;
plot(t, original_signal, 'b', 'LineWidth', 1.5);
hold on;
plot(t, noisy_signal, 'r');
plot(t, filtered_signal, 'k', 'LineWidth', 1.5);
legend('Original Signal', 'Noisy Signal', 'Filtered Signal');
title('Comparison of Original, Noisy, and Filtered Signals');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Optional: Display Signal-to-Noise Ratio (SNR)
snr_before = snr(original_signal, noise);
snr_after = snr(original_signal, filtered_signal - original_signal);

fprintf('SNR Before Filtering: %.2f dB\n', snr_before);
fprintf('SNR After Filtering: %.2f dB\n', snr_after);
