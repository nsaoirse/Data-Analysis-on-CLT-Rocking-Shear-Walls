clc
clear all
close all
set(0,'DefaultFigureWindowStyle','docked') 
% set(0,'DefaultFigureWindowStyle','default') 
load('test_data.mat')
MainU={};
for TN=6:14;
time=test_data{TN,1}.time;
   Fs=1/(time(2)-time(1));
Test="Test"+string(TN);
Measurements=test_data{TN,:};
opt_name={  {'ACBE'},  {'ACBU'}, {'AC1E'}, {'AC1N'}, {'ACRE'},  {'ACRN'}};
OrganizeTheData
options={  {ACBE},  {ACBU},{AC1E}, {AC1N},  {ACRE},  {ACRN}};
opt_labels={{ACBE_labels},  {ACBU_labels},{AC1E_labels}, {AC1N_labels},  {ACRE_labels},  {ACRN_labels}};

for opt=1:size(options,2);
    AllDisp=[];
    for count=1:size(opt_labels{opt}{1},1);
        figure(opt+1)
        Acurr=options{opt}{1}(:,count);
        an = sum(Acurr,2);
        f = fftshift(Fs*(0:(length(time)/2))/(2*pi*length(time)));
        ant=abs(fftshift(fft(an)));
        filter =exp(-8*(f).^2)+ (-.18*(f-f(220)).^2);
        filter2 = (1-exp(-15*(f).^2));%     
        anft = filter.*ant;
        anft =filter2.*anft;
        Acurr = ifft((anft));
        Data.(Test).(opt_name{opt}{1}).(cell2mat(opt_labels{opt}{1}(count,:))).Acceleration=Acurr;
    end
    Data.(opt_name{opt}{1}).AllAccelerations.(Test)=options{opt};
end


figure

D1=Data.AC1E.AllAccelerations.(Test){1};
DR=Data.ACRE.AllAccelerations.(Test){1};
DB=Data.ACBE.AllAccelerations.(Test){1};
Ds.ID_Bto1_E=(sum(D1,2)./size(D1,2))-(sum(DB,2)./size(DB,2));
Ds.ID_1toR_E=(sum(DR,2)./size(DR,2))-(sum(D1,2)./size(D1,2));

subplot(2,1,1)
hold on
plot(time,Ds.ID_Bto1_E,'r')
xlabel('Time (sec)')
ylabel('Accel (g)')
title('Base to Floor 1')

subplot(2,1,2)
plot(time,Ds.ID_1toR_E,'r')
hold on
xlabel('Time (sec)')
ylabel('Accel (g)')
title('Floor 1 to Roof')
sgtitle("Test No. "+string(TN)+" Interstory Acceleration")
Resc=[DB,Ds.ID_Bto1_E,Ds.ID_1toR_E];
% Resc=[DB,D1,DR];
[Uw,Sw,Vw]=svd(Resc,'econ');
figure(80)
plot(Uw(:,1:2))
figure(81)
plot(diag(Sw))
Um=Uw*Sw;

% for opt=size(options,2);
A=cell2mat(options{opt});
Dcurr=Resc;
L=opt_labels{opt};
%% SVD 

[u, s, v] = DoSVDThings(Dcurr,'Acceleration',size(Dcurr,2));
figure(opt)
colorOrder = {'black','blue','red','black','blue','red','black','blue','red'};
hold on
RR=3;
LastRec=0.*Dcurr(:,1);
for ii = 1:RR
    fig=figure(5*TN*opt+1);
     subplot(RR,4,[(4*ii)-3,(4*ii)-2])
    hold on
   DcAv=detrend(sum(Dcurr,2)./size(Dcurr,2));
    plot(time,DcAv,'Color','red','LineWidth',TN/15);
    RN=Uw*Sw;
    Recon=RN(:,ii);
    [~,wUw]=max(abs(Recon));
      plot(time,detrend(Recon),'Color','black','LineWidth',TN/20);
    legend("Original Signal",...
            "SVD Mode "+string(ii),'Location','SouthEast','Orientation','horizontal')
    title("Test No. "+string(TN)+" {U} Mode "+string(ii))
    grid on
    xlabel('Time (sec)')
    ylabel('Accel (g)')
     subplot(RR,4,(4*ii)-1)
    D_inst=Dcurr(:,ii);
    
    f = fftshift(Fs*(0:(length(time)/2))/(2*pi*length(time)));
    X_mags=abs(fftshift(fft(Recon)));
    X_mags=real(X_mags(end/2 : end));
    plot((f),(X_mags),'Color','black','LineWidth',TN/10);
    grid on
    hold on
    xlabel('Frequency ({hz})')
    ylabel('dB')
    title("Test No. "+string(TN)+" FFT({U} Mode "+string(ii)+")")
       set(gca,'XScale','log')
    [mx indx]=max((X_mags));
    ModeFreq(TN,ii)=f(indx);
    plot(f(indx),mx,'or'); 
    plot([f(indx),f(indx)*1/2],[mx,0.9*mx],'r');
    text(f(indx)*1/80,mx*0.9,"{\omega}_n = "+string(f(indx))+" hz");
    subplot(RR,4,4*ii)
    hold on
   %Power Spectral Density 
power=X_mags.*conj(X_mags)/length(fft(X_mags));  
% power=power./trapz(f,power);

plot(f,power,'k'); hold on

plot(f(indx),power(indx),'or')
plot([f(indx),f(indx)*1/2],[power(indx),0.9*power(indx)],'r');
    text(f(indx)*1/80,power(indx)*0.9,"{\omega}_n = "+string(f(indx))+" hz");
    grid on
    set(gca,'XScale','log')
    xlabel('Frequency ({hz})')
    ylabel('PSD ({dB/hz})')
    title("PSD({U} Mode "+string(ii)+") Estimate")
    
    sgtitle("Test No. "+string(TN)+" Interstory Acceleration POD")
   MainU(TN-5)={RN(:,1)};
   WnTest(TN-5)=f(indx);
end

 print((Test)+".jpg",'-djpeg')
% close all

end
