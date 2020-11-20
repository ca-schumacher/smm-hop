function [ F ] = stickfigure_GRF(xyFP, xyCOM, phi, lever_arm, l_seg, l_f, alpha, F_leg, tout)
%%---------------------------------------
% Data visualisation for Socket model
%
% Christian Schumacher
% Technical University Darmstadt
% ? Christian Schumacher, 2016
%---------------------------------------
% INPUT:


% OUTPUT: 

% v = VideoWriter('Hopping_VFB.avi');
% open(v);

for i=1:10:length(xyCOM(:,1))
    
    xyKnee(i,1) = xyCOM(i,1)+cos(phi(i)/2)*l_seg; %sin(pi/2-phi(i)/2)
    xyKnee(i,2) = xyCOM(i,2)-sin(phi(i)/2)*l_seg;%-cos(pi/2-phi(i)/2)
%     xyKnee(i,1) = xyCOM(i,1)+cos(alpha(i))*l_f/2+cos(pi/2-phi(i)/2)*lever_arm(i);
%     xyKnee(i,2) = xyCOM(i,2)-sin(alpha(i))*l_f/2+sin(pi/2-phi(i)/2)*lever_arm(i);
end

step_time = max(tout)/length(tout);

%% Plot
% tic
set(0,'DefaultAxesFontName','Arial'); 
set(0,'DefaultTextFontName','Arial');
% set(0,'FontWeigth','bold');
set(0,'DefaultAxesFontSize',20);  
set(0,'DefaultTextFontSize',20); 

%     YY = [xyFP  xyCOM]; %xyKnee
%          
%     ZZ = [xyFP  xyCOM]; %xyKnee

    scrsz = get(groot,'ScreenSize');
    
figure(99)
set(99,'position',[1 1 scrsz(3) scrsz(4)])
%h_old = plot(0,0);
left = subplot(1,3,1);
h0 = plot([-0.1 0.5],[0 0],'k','LineWidth',4);
hold on   
% grid on
xlabel('position [m]')
ylabel('height [m]')
set(findall(99,'type','text'),'fontWeight','bold')    
F(50000) = struct('cdata',[],'colormap',[]);
       
    h1 = animatedline; 
    h4 = animatedline('LineWidth',6);

    for k=1:50:50000%length(xyFP)

    addpoints(h1,[xyFP(k,1) xyKnee(k,1) xyCOM(k,1)],... 
                 [xyFP(k,2) xyKnee(k,2) xyCOM(k,2)]);
             
    addpoints(h4,[xyCOM(1:k,1)],[xyCOM(1:k,2)])
    xMin = xyCOM(k,1)-0.1;
    xMax = xyCOM(k,1)+0.3;
    axis equal
    axis([-0.1 0.5 -0.1 1.5])
    

    h1.Color = 'black';
    h1.LineStyle = '-';
    h1.LineWidth = 8;
    h1.Marker = 'o';
    h1.MarkerSize = 20;
    h1.MarkerFaceColor = 'red';
    h1.MarkerEdgeColor = 'red';
    h4.Color = 'red';
    h1.LineWidth = 10;
%     h3.Color = 'black';
%     h3.LineWidth = 6;
%     h3.Marker = 'o';
%     h3.MarkerSize = 16;
%     h3.MarkerFaceColor = 'black';
%     h3.MarkerEdgeColor = 'black';


    right = subplot(1,3,[2,3]);
    hold on   
    grid on
    xlabel('time [s]');
    ylabel('vertical GRF [N]');
    set(findall(99,'type','text'),'fontWeight','bold')
    axes(right);
%     h2 = animatedline; 
%     addpoints(h2,tout(k),F_leg(k,2));
    h3 = animatedline('LineWidth',8,'Color','blue');
    if k<1000
        addpoints(h3,tout(1:k),F_leg(1:k,2))
    else
        addpoints(h3,tout((k-500):k),F_leg((k-500):k,2))
    end
    xMin = tout(k)-0.5;
    xMax = tout(k)+0.5;
    yMax = max(F_leg(:,2))+200;
    axis normal
    axis([xMin xMax -10 yMax])


%     h2.Color = 'blue';
%     h2.Marker = 'o';
%     h2.MarkerSize = 6;
%     h2.MarkerFaceColor = 'blue';
%     h2.MarkerEdgeColor = 'blue';

    pause(0.05)
    drawnow limitrate
    set(findall(99,'type','text'),'fontWeight','bold')
%     F(k) = getframe(99);
%     writeVideo(v,F(k));
%     clearpoints(h2)
        clearpoints(h1)
%     clearpoints(h2)
    end
        
%     drawnow limiterate
% close(v);

end
