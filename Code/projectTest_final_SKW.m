clc
clear
close all

load('test_data.mat')

test_num = 14;
%A = [test_data{14,1}.AC1E402, test_data{14,1}.AC1E401, test_data{14,1}.AC1E301, test_data{14,1}.AC1E102, test_data{14,1}.AC1E101, test_data{14,1}.ACRE402, test_data{14,1}.ACRE401, test_data{14,1}.ACRE313, test_data{14,1}.ACRE102, test_data{14,1}.ACRE101];
A = [test_data{test_num,1}.AC1E402';
     test_data{test_num,1}.AC1N402';
     test_data{test_num,1}.AC1E402';
     test_data{test_num,1}.AC1N402';
     test_data{test_num,1}.AC1E301';
     test_data{test_num,1}.AC1N301';
     test_data{test_num,1}.AC1E102';
     test_data{test_num,1}.AC1N102';
     test_data{test_num,1}.AC1E101';
     test_data{test_num,1}.AC1N101';
     test_data{test_num,1}.ACRE402';
     test_data{test_num,1}.ACRN402';
     test_data{test_num,1}.ACRE401';
     test_data{test_num,1}.ACRN401';
     test_data{test_num,1}.ACRE313';
     test_data{test_num,1}.ACRN313';
     test_data{test_num,1}.ACRE102';
     test_data{test_num,1}.ACRN102';
     test_data{test_num,1}.ACRE101';
     test_data{test_num,1}.ACRN101'];
SignalName = {'AC1E402','AC1N402','AC1E402','AC1N402','AC1E301','AC1N301', ...
              'AC1E102','AC1N102','AC1E101','AC1N101','ACRE402','ACRN402', ...
              'ACRE401','ACRN401','ACRE313','ACRN313','ACRE102','ACRN102', ...
              'ACRE101','ACRN101'};
time = test_data{test_num,1}.time;

L = time(end);
n = length(time);
t2 = linspace(-L,L,n+1);
t = time;
k = (2*pi/(2*L))*[0:(n/2-1) -n/2:-1];
g = 386.4;

anf = zeros(size(A));
dnf = zeros(size(A));
for ii = 1:size(A,1)
    an = detrend(A(ii,:));
    vn = cumtrapz(time,an*g);
    dn = cumtrapz(time,vn);
    
    ant = fft(an*g);
    an = ifft(ant);

    filter = exp(-0.008*(k).^2);
    filter2 = 1-exp(-1*(k).^2);
    anft = filter.*ant;
    anft = filter2.*anft;
    anf(ii,:) = ifft(anft);
    
    vnf = cumtrapz(time,anf(ii,:));
    dnf(ii,:) = cumtrapz(time,vnf);
    
    if ii == 15      
        
        figure('units','inches','position',[0.5 0.5 6 5])
        subplot(3,1,1)
        hold on
        plot(fftshift(k), abs(fftshift(ant))/max(abs(fftshift(ant))),'Color','black','DisplayName','Signal')
        plot(fftshift(k),fftshift(filter),'k','Linewidth',1.5,'Color','blue','DisplayName','Low-Pass Filter')
        plot(fftshift(k),fftshift(filter2),'k','Linewidth',1.5,'Color','red','DisplayName','High-Pass Filter')
        legend('show','location','northeast')
        xlabel('wavenumber (k)')
        ylabel('|a_{t}|/max(|a_{t}|)')
        xlim([-50,50])
        box on; grid on
        set(gca,'GridLineStyle',':','GridColor',[0.7 0.7 0.7],'GridAlpha',1)
        set(gca,'FontSize',10,'FontName','Arial')
        set(gcf, 'Color', 'w') 

        subplot(3,1,2)
        plot(fftshift(k),abs(fftshift(anft))/max(abs(fftshift(anft))),'color','black','DisplayName','Filtered Signal','Linewidth',1.5)
        xlabel('wavenumber (k)')
        ylabel('|a_{t}|/max(|a_{t}|)')
        legend('show','location','northeast')
        xlim([-50,50])
        box on; grid on
        set(gca,'GridLineStyle',':','GridColor',[0.7 0.7 0.7],'GridAlpha',1)
        set(gca,'FontSize',10,'FontName','Arial')
        set(gcf, 'Color', 'w') 
        
        subplot(3,1,3)
        hold on
        plot(t,an,'linewidth',1.5,'Color','black','DisplayName','Unfilted Signal')
        plot(t,anf(ii,:),'linewidth',1.5,'Color','blue','DisplayName','Filtered Signal')
        legend('show','location','northeast')
        xlim([0 45])
        xlabel('Time (s)')
        ylabel('Accel (g)')
        box on; grid on
        set(gca,'GridLineStyle',':','GridColor',[0.7 0.7 0.7],'GridAlpha',1)
        set(gca,'FontSize',10,'FontName','Arial')
        set(gcf, 'Color', 'w') 
        saveas(gcf,'filter_ACRE313.png')
    end
    
end

[u_a,s_a,v_a] = svd(anf,'econ');

%reconstruction
rank = [1,2,5,10];
low_rank = cell(length(rank),1);
for ii = 1:length(rank)
    low_rank{ii,1} = u_a(:,1:rank(ii))*s_a(1:rank(ii),1:rank(ii))*v_a(:,1:rank(ii))';
end

figure('units','inches','position',[0.5 0.5 5 3])
hold on
plot(diag(s_a)/sum(diag(s_a))*100,'Color','black','linewidth',1.5)
xlabel('Mode')
ylabel('Energy in Mode (%)')
xlim([1 20])
xticks(1:1:20)
box on; grid on
set(gca,'GridLineStyle',':','GridColor',[0.7 0.7 0.7],'GridAlpha',1)
set(gca,'FontSize',10,'FontName','Arial')
set(gcf, 'Color', 'w')
saveas(gcf,'Energy.png')

figure('units','inches','position',[0.5 0.5 5 4])
hold on
colorList = {'black','blue','red'};
for ii = [3 2 1]
    plot(u_a(:,ii),'color',colorList{ii},'DisplayName',['Mode = ', num2str(ii)],'Linewidth',1.5)
end
legend('show','location','northwest')
xlabel('Node')
ylabel('Mode Magnitude')
box on; grid on
set(gca,'GridLineStyle',':','GridColor',[0.7 0.7 0.7],'GridAlpha',1)
set(gca,'FontSize',10,'FontName','Arial')
set(gcf, 'Color', 'w')
saveas(gcf,'modes.png')

%% mode shapes

coords = [-10  29 12;
           10  29 12;
            0   0 12;
          -10 -29 12;  
           10 -29 12;
          -10  29 22;
           10  29 22;
            0   0 22;
          -10 -29 22;  
           10 -29 22];

mode_num = 1;  
scale = 10;

num_modes = 6;
coords_mode = cell(num_modes,1);
for ii = 1:num_modes
    coords_mode{ii,1} = coords;
    coords_mode{ii,1}(:,1) = coords(:,1) + u_a(1:2:end,ii)*scale;
    coords_mode{ii,1}(:,2) = coords(:,2) + u_a(2:2:end,ii)*scale;
end

coords_new(:,1) = coords(:,1) + u_a(1:2:end,mode_num)*scale;
coords_new(:,2) = coords(:,2) + u_a(2:2:end,mode_num)*scale;
coords_new(:,3) = coords(:,3);

lines = [1 2;
         1 4;
         2 5;
         4 5;
         1 3;
         2 3;
         4 3;
         5 3;
         6 7;
         6 9;
         7 10;
         9 10
         6 8;
         7 8;
         9 8;
         10 8];

colorList = {'black','blue','red'};
figure('units','inches','position',[0.5 0.5 7.5 9.5])
for jj = 1:num_modes
    subplot(3,2,jj)
    for ii = 1:size(lines,1)
        plot3([coords(lines(ii,1),1), coords(lines(ii,2),1)],[coords(lines(ii,1),2), coords(lines(ii,2),2)],[coords(lines(ii,1),3), coords(lines(ii,2),3)],'o-','color',[0.6 0.6 0.6],'MarkerFaceColor',[0.6 0.6 0.6],'markersize',4)
        hold on
        plot3([coords_mode{jj,1}(lines(ii,1),1), coords_mode{jj,1}(lines(ii,2),1)], ...
              [coords_mode{jj,1}(lines(ii,1),2), coords_mode{jj,1}(lines(ii,2),2)], ...
              [coords_mode{jj,1}(lines(ii,1),3), coords_mode{jj,1}(lines(ii,2),3)], ...
              'o-','markersize',4,'color',colorList{1},'MarkerFaceColor',colorList{1})
        axis equal  
    end
    view(-37.5,20)
    xlim([-15,15])
    ylim([-40,40])
    zlim([0,24])
    title(['Mode ' num2str(jj)])
    box on; grid on
    set(gca,'GridLineStyle',':','GridColor',[0.7 0.7 0.7],'GridAlpha',1)
    set(gca,'FontSize',10,'FontName','Arial')
    set(gcf, 'Color', 'w')
end
saveas(gcf,'modes_shapes.png')

%% reconstruction

sensors = [5,15];
figure('units','inches','position',[0.5 0.5 7.5 8.5])
for ii = 1:length(rank)
    for jj = 1:length(sensors)
        subplot(length(rank),length(sensors),ii*length(sensors)+jj-length(sensors))
        hold on
        plot(time,A(sensors(jj),:)*g,'DisplayName','Original','Color','Black','Linewidth',1.2)
        plot(time,anf(sensors(jj),:),'DisplayName','Filtered','Color','Blue','Linewidth',1.2)
        plot(time,low_rank{ii,1}(sensors(jj),:),'DisplayName',['rank = ' num2str(rank(ii))],'Color','Red','Linewidth',1.2)
        xlabel('Time (sec)')
        ylabel('Accel (g)')
        title(['Sensor ' SignalName{sensors(jj)}])
        legend('show','location','northeast')
        xlim([0 45])
        box on; grid on
        set(gca,'GridLineStyle',':','GridColor',[0.7 0.7 0.7],'GridAlpha',1)
        set(gca,'FontSize',8,'FontName','Arial')
        set(gcf, 'Color', 'w')
    end
end
saveas(gcf,'reconstruction.png')

        


