%% Final Project
% Script for final project

%% Load data
clc; clear; close all

load('test_data.mat')

g = 386.09; % Acceleration due to gravity (inches per second per second)
n1 = 14; % number of runs
n2 = 10; % number of acceleromets

idx_test = 14; % the test number to run
idx_sensor = 8; % the sensor data to use

tau = 1; % bandwidth of filter (window size)
N_steps = 301; % number of time steps taken

for idx1 = idx_test
A = [test_data{idx1,1}.AC1E402'; test_data{idx1,1}.AC1E401'; ...
    test_data{idx1,1}.AC1E301'; test_data{idx1,1}.AC1E102'; ...
    test_data{idx1,1}.AC1E101'; test_data{idx1,1}.ACRE402'; ...
    test_data{idx1,1}.ACRE401'; test_data{idx1,1}.ACRE313'; ...
    test_data{idx1,1}.ACRE102'; test_data{idx1,1}.ACRE101'];

t = test_data{idx1,1}.time;
    if rem(length(t),2)==0
    else
        t(end) = [];
        A(:,end) = [];
    end

L = t(end)+(t(2)-t(1));
n = length(t);
k = (2*pi/L)*[0:n/2-1 -n/2:-1];
    ks = fftshift(k);

filter2 = 1-exp(-1*(k).^2);

for idx2 = idx_sensor
acc = A(idx2,:); % get accelerations
    acc_t = fft(acc); % FFT
    acc_t = filter2.*acc_t; % Filter
    acc = ifft(acc_t); % iFFT
v = acc';

% Get spectrogram
tslide=linspace(t(1),t(end),N_steps); % array of centered times of filter
Sgt_spec=[]; % empty array of filtered signal frequency content
    % figure
for j=1:length(tslide)
    g=exp(-tau*(t-tslide(j)).^2); % Gabor filter
    Sg=g.*v; % filter signal
    Sgt=fft(Sg); % transform filtered signal (frequency content)
    Sgt_spec=[Sgt_spec abs(fftshift(Sgt))]; % add Sgt to array of Sgt
        % % Plot
        % plot(t,v,'k',t,g,'r')
        % subplot(3,1,1), plot(t,v,'k',t,g,'r') % plot the signal and filter
        %     axis([0 37.5 -0.5 1])
        % subplot(3,1,2), plot(t,Sg,'k')  % plot the filtered signal
        %     axis([0 37.5 -0.5 0.5])
        % subplot(3,1,3), plot(ks,abs(fftshift(Sgt)))
        % axis([ks(1) ks(end) 0 ])
        % drawnow
        % pause(0.1)
end

%% Plot spectrogram 

% Plot spectrogram
figure
pcolor(tslide,ks,Sgt_spec), shading interp
set(gca,'Ylim',[0 ks(end)],'Fontsize',[14])
colormap(hot)
xlabel('time (t)'); ylabel('frequency (\omega)')

% Plot zoomed in spectrogram
figure
pcolor(tslide,ks,Sgt_spec), shading interp
set(gca,'Ylim',[0 50],'Fontsize',[14])
colormap(hot)
xlabel('time (t)'); ylabel('frequency (\omega)')
end
end