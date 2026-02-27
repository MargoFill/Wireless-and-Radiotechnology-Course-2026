%% Effect of SNR on ASK Communication System

clc;
clear;
close all;

%% Parameters
fs = 1000;              % Sampling frequency (Hz)
t = 0:1/fs:1;           % Time vector (1 sec)
f_c = 50;               % Carrier frequency (Hz)

SNR_values = [10 5 0 -5];   % SNR values in dB

%% Generate Binary Message Signal
message_signal = randi([0 1], 1, length(t));

%% Carrier Signal
carrier = cos(2*pi*f_c*t);

%% ASK Modulation (On-Off Keying)
modulated_signal = message_signal .* carrier;

%% Plot Original Modulated Signal
figure;
plot(t, modulated_signal);
title('ASK Modulated Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

%% Loop Over Different SNR Values
for i = 1:length(SNR_values)
    
    SNR_dB = SNR_values(i);
    
    % Add Gaussian Noise
    received_signal = awgn(modulated_signal, SNR_dB, 'measured');
    
    % Coherent Demodulation
    demodulated = received_signal .* carrier;
    
    % Low-pass Filter Design
    cutoff_frequency = 10;      % Cutoff frequency (Hz)
    filter_order = 4;
    Wn = cutoff_frequency/(fs/2);
    [b,a] = butter(filter_order, Wn, 'low');
    
    filtered_signal = filtfilt(b,a,demodulated);
    
    % Decision Device (Threshold Detection)
    detected_bits = filtered_signal > 0.5;
    
    %% Plot Results
    figure;
    
    subplot(3,1,1);
    plot(t, received_signal);
    title(['Received Signal (SNR = ' num2str(SNR_dB) ' dB)']);
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    
    subplot(3,1,2);
    plot(t, filtered_signal);
    title('Demodulated & Filtered Signal');
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
    
    subplot(3,1,3);
    plot(t, message_signal, 'b', 'LineWidth',1.5);
    hold on;
    plot(t, detected_bits, 'r--');
    legend('Original Bits','Detected Bits');
    title('Bit Comparison');
    xlabel('Time (s)');
    ylabel('Bit Value');
    grid on;
    
end

%% Optional: Bit Error Rate (BER) Calculation
for i = 1:length(SNR_values)
    received_signal = awgn(modulated_signal, SNR_values(i), 'measured');
    demodulated = received_signal .* carrier;
    filtered_signal = filtfilt(b,a,demodulated);
    detected_bits = filtered_signal > 0.5;
    
    BER = sum(abs(message_signal - detected_bits))/length(message_signal);
    fprintf('SNR = %d dB, BER = %.4f\n', SNR_values(i), BER);
end
