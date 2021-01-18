x = 1:10;
y = sin(x);
plot(x,y);  
plot(x);  % a line. plot(x) will replace plot(x,y)!


%% 
x2 = 1:10;
y2 = sin(x2);
plot(x2,y2,'.-r');
hold on % change mode, add plot ,not replace. default value is replace!
plot(x2);  % a line. plot(x) will be added!
plot(x2+y2);  

legend('sin(x)','x','x+sin(x)')


%%  
x3 = 1:0.3:10;
y3 = sin(x3);
hold on % add ,not replace 
plot(x3,y3,'--r');
plot(x3,x3,'--g');
line([1 10],[0 0]) % line from (1,0) to (10,0)
line([4 4], [0 sin(4)])  % line from (4,0) to (4 ,sin(4))  
line([5 5], [0 sin(5)])  % line from (5,0) to (5 ,sin(5))

legend('y=sin(x)','y=x','Location','Best') % add legend 

title('Just a test.')% title , latex 
xlabel('x label test')
ylabel('y label test')

t = '$$ \int_{4} ^{5} \sin(x) dx $$';   % latex format 
text(1.5,5,t,'Interpreter','latex') % pos is (1.5,5)

annotation('arrow',[0.25 0.45],[0.55 0.2]) % creates an annotation object  
                   %head pos: (0.25,0.55) .* (width,height)
                   %tail pos: (0.45,0.2) .* (width,height)

annotation('rectangle',[.1 .1 .3 .3])

%% 
x4 = 1:0.3:10;
y4 = sin(x4);
h = plot(x4,y4); % line object 
set(gca,'xlim',[pi,3*pi]) % x in [pi,3pi]
set(gca,'ylim',[-1.5,1.5]) % y in [-1.5,1.5] Just a test! 
set(gca,'fontsize',15) % set tick' font size equal to 15px
set(gca,'xtick',pi:pi/2:3*pi) % use pi on tick.  
set(gca,'xticklabel',180:90:3*180)  



%% 
x5 = 1:10;
y5 = sin(x5);
h = plot(x5,y5,'-d');
set(h,'markeredgecolor','r',...
      'markerfacecolor','g',...
      'markersize',10) % set marker style 

%% figure01 
%x = 1:0.02*pi:2;% can't get 2!
x = linspace(1,2,90); % can get 2! num is 90,
y1 = x.^2;
y2 = sin(2*pi*x);
hold on; % add not replace!  
l1 = plot(x,y1,'k');% color is black
l2 = plot(x,y2,'ro');% marker shape is circle,color is red
legend([l1,l2],'t^2','sin(2\pi t)','location','northwest')% legend 
title('Mini Assignment #1')
xlabel('Time (ms)')
ylabel('f(t)')
set(gca,'xtick',linspace(1,2,6));%[1,2] num is 6  
% to figure2 
set(gca,'fontsize',16) % setting axes's fontsize 
set(l1,'linewidth',4) % setting l1's linewidth to 4  
set(l2,'color',[160,32,240]/255,... % change color to purple  
       'marker','.',... % change marker to point 
       'markersize',16)    



%% multipe figures 
x =  1:0.1:10;
y1 = x.^2;
y2 = exp(x);
%====
figure('position',[100,200,400,400]);% figure 1 
plot(x,y1);
%====
figure('position',[600,600,400,400]);% figure 2 
plot(x,y2);  

%% small figures in one figure 
x = linspace(-1,1,50);
y = sqrt(1-x.^2);
x = [x,fliplr(x)];%fliplr Flip array in left/right direction.%reverse 
y = [y,-fliplr(y)];
subplot(221)
plot(x,y);
axis normal 
title('normal[default]')
grid on 
box off 

subplot(222)
plot(x,y);
axis square  %makes the current axis box square in size. x axis's length == y axis's length 
title('square')
axis off      

subplot(223)
plot(x,y);
axis equal  % x axis's unit == y axis's unit 
title('equal')
grid on 
box off 


%% save to file 
x = linspace(1,10,100);
y = sin(x);
plot(x,y);
saveas(gcf,'test01','png') % bitmap format
saveas(gcf,'test01','svg') % vector format 

