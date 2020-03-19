%% Final Project
% Script for final project

%% Load data
clc; clear; close all

load('wn_data.mat')

g = 386.09; % Acceleration due to gravity (inches per second per second)
n1 = 21; % number of runs
n2 = 10; % number of acceleromets

for idx1 = 1:n1 % loop through each test
% Aggregate the accelerations
A = [wn_data{idx1,1}.AC1E402'; wn_data{idx1,1}.AC1E401'; ...
wn_data{idx1,1}.AC1E301'; wn_data{idx1,1}.AC1E102'; ...
wn_data{idx1,1}.AC1E101'; wn_data{idx1,1}.ACRE402'; ...
wn_data{idx1,1}.ACRE401'; wn_data{idx1,1}.ACRE313'; ...
wn_data{idx1,1}.ACRE102'; wn_data{idx1,1}.ACRE101'];

% Get the time of each run
t = wn_data{idx1,1}.time;
    if rem(length(t),2)==0 % Remove last value if length is odd
    else
        t(end) = [];
        A(:,end) = [];
    end

% Compute k
L = t(end)+(t(2)-t(1));
n = length(t);
k = (2*pi/L)*[0:n/2-1 -n/2:-1];
    ks = fftshift(k);

% Gaussian filter
filter = exp(-0.008*(k).^2);
filter2 = 1-exp(-1*(k).^2);

% initiate average data variable
Uave = zeros(1,length(A));
for idx2 = 1:n2 % Loop through each sensor
acc = A(idx2,:); % get accelerations

% Filter
Utn=fft(acc); 
    Utn = filter.*Utn; % Gaussian
    Utn = filter2.*Utn; % Inverse Gaussian
    
% Sum
Uave = Uave + Utn;

% Get max value of spectral content of each sensor
[mxv1,idxm1] = max(abs(Utn));
nrg(idx1,idx2) = mxv1;
w(idx1,idx2) = k(idxm1);
end
% Get max value of spectral content of average
[mxv1,idxm1] = max(abs(Uave));
nrg_avg(idx1) = mxv1/idx2;
w_avg(idx1) = k(idxm1);
end

%% Plot natural frequencies and energy percentage

% Plot natural frequency of indivual test and sensors
tst_no = [1 2 3 7 8 9 16 20 21]; % test number of interest
figure(1)
for idx_p = 1:length(tst_no)
y1 = 2*pi./w(tst_no(idx_p),:); % each sensor
y2 = 2*pi./mean(w(tst_no(idx_p),:))*[1 1 1 1 1 1 1 1 1 1]; % average
y3 = 2*pi./w_avg(idx_p)*[1 1 1 1 1 1 1 1 1 1]; % average filter

subplot(3,3,idx_p)
plot(y1,'ko', 'Linewidth', [1.0]); hold on
plot(y2,'blue'); hold on
plot(y3,'red'); hold off
title(['Test number ' num2str(tst_no(idx_p))])
xlabel('Sensor number')
ylabel('Natural period (s)')
ylim([0.6 1.2])
xlim([1 10])
grid on
end
legend('Original','Average of original','Average filter')

% Plot avg nat freq of each run
figure(2)
subplot(2,1,1)
plot(2*pi./w_avg,'o')
xlabel('Test number')
ylabel('Natural period (s)')
ylim([0.6 1.2])
xlim([1 10])
title('Average filter method')
grid on
hold on