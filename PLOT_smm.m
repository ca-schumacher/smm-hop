%%---------------------------------------
% Plotting Sensor Motor Maps
%
% Christian Schumacher
% Technical University Darmstadt
% ? Christian Schumacher, 2016
%---------------------------------------

%% This script creates plots of the SMM

clear all
close all
clc
warning off

set(0,'DefaultAxesFontName','Arial'); 
set(0,'DefaultTextFontName','Arial');
set(0,'DefaultAxesFontSize',16);  
set(0,'DefaultTextFontSize',14); 

% load parameters
loadname = strcat('DATA_results_smm.mat');
load(loadname)
g           = 9.81;
m           = 80;

X=1:loop_lambdas;
Y=1:loop_lambdas;
            %% plot stability
            Tri_steps_to_fall(Tri_steps_to_fall==0) = nan;
            figure(1)
            hold on
            Z = Tri_steps_to_fall(X,Y)';
            [C,h] = contourf(X,Y,Z,10,'LineStyle','none','ShowText','on');%
            hold on
            shading interp 
            plot([1 (loop_lambdas-1)/2+1],[1 loop_lambdas],'k','LineWidth',5)
            plot([(loop_lambdas-1)/2+1 loop_lambdas],[loop_lambdas 1],'k','LineWidth',5)
            plot([1 loop_lambdas],[1 1],'k','LineWidth',5)
            plot((loop_lambdas-1)/2+1,((loop_lambdas-1)/3+1),'ok','MarkerFaceColor','k','MarkerEdgeColor','w','MarkerSize',10)
            axis([1 loop_lambdas 1 loop_lambdas])
            plot(1,1,'ok','MarkerFaceColor','k','MarkerSize',20)
            plot((loop_lambdas-1)/2+1,loop_lambdas,'ok','MarkerFaceColor','k','MarkerSize',20)
            plot(loop_lambdas,1,'ok','MarkerFaceColor','k','MarkerSize',20)
            set(gca,'XTickLabel','')
            set(gca,'YTickLabel','')
            title(strcat('Stability Map')) 
            [cmin,cmax] = caxis;
            caxis([0,50]);
            colormap jet
%             colorbar%(flipud(colormap))
            c1 = colorbar('Limits',[0, 50]);
            c1.Label.String = 'steps to fall';
%             
            %% plot frequency
            Tri_freq_hop(Tri_freq_hop<1) = nan;
            figure(10)
            hold on
            Z = Tri_freq_hop(X,Y)';
            [C,h] = contourf(X,Y,Z,10,'LineStyle','none','ShowText','on');%
            hold on
            shading interp 
            plot([1 (loop_lambdas-1)/2+1],[1 loop_lambdas],'k','LineWidth',5)
            plot([(loop_lambdas-1)/2+1 loop_lambdas],[loop_lambdas 1],'k','LineWidth',5)
            plot([1 loop_lambdas],[1 1],'k','LineWidth',5)
            plot((loop_lambdas-1)/2+1,((loop_lambdas-1)/3+1),'ok','MarkerFaceColor','k','MarkerEdgeColor','w','MarkerSize',10)
            axis([1 loop_lambdas 1 loop_lambdas])
            plot(1,1,'ok','MarkerFaceColor','k','MarkerSize',20)
            plot((loop_lambdas-1)/2+1,loop_lambdas,'ok','MarkerFaceColor','k','MarkerSize',20)
            plot(loop_lambdas,1,'ok','MarkerFaceColor','k','MarkerSize',20)
            set(gca,'XTickLabel','')
            set(gca,'YTickLabel','')
            title(strcat('Frequency Map')) 
            [cmin,cmax] = caxis;
            caxis([1,3]);
            colormap jet
%             colorbar%(flipud(colormap))
            c10 = colorbar('Limits',[1, 3]);
            c10.Label.String = 'frequency in Hz';
            
            %% plot performance                        
            [maxval_hm, maxind_hm] = max(Tri_h_hop(:)-0.99);
            [maxxidx_hm, maxyidx_hm] = ind2sub(size(Tri_h_hop),maxind_hm);
%             
            hFig = figure(20);
%             set(hFig, 'Position', [10 10 1240 1000]) 
            hold on
            ZZ = Tri_h_hop(X,Y)'-0.99;
            [C,h] = contourf(X,Y,ZZ,20,'LineStyle','none','ShowText','on');%
            hold on
            shading interp 
            plot([1 (loop_lambdas-1)/2+1],[1 loop_lambdas],'k','LineWidth',5)
            plot([(loop_lambdas-1)/2+1 loop_lambdas],[loop_lambdas 1],'k','LineWidth',5)
            plot([1 loop_lambdas],[1 1],'k','LineWidth',5)
            plot((loop_lambdas-1)/2+1,((loop_lambdas-1)/3+1),'ok','MarkerFaceColor','k','MarkerEdgeColor','w','MarkerSize',10)
            plot(maxxidx_hm,maxyidx_hm,'ok','MarkerFaceColor','r','MarkerEdgeColor','w','MarkerSize',15)
            text((maxxidx_hm+1), maxyidx_hm,num2str(round(maxval_hm,2)))%annotation('textarrow',x,y,'String',num2str(maxval))
            axis([1 loop_lambdas 1 loop_lambdas])
            plot(1,1,'ok','MarkerFaceColor','k','MarkerSize',20)
            plot((loop_lambdas-1)/2+1,loop_lambdas,'ok','MarkerFaceColor','k','MarkerSize',20)
            plot(loop_lambdas,1,'ok','MarkerFaceColor','k','MarkerSize',20)
            set(gca,'XTickLabel','')
            set(gca,'YTickLabel','')
            title(strcat('Performance Map')) 
            [cmin,cmax] = caxis;
%             caxis([0,0.1])
            colormap jet
            c20 = colorbar;
            c20.Label.String = 'hopping height in m';
            
