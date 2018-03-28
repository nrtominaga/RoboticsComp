clear 
clc
for index = 11:-.5:1
    disp(index);
end
%%
clear 
clc
for index = 1:.5:11
    disp(index);
end
%%
clear 
clc
time = 1:1:8;
for index = time
    disp(index);
end
%%
clear 
clc
%dont do this
time = linspace(0,50,100);
for index = length(time);
    disp(index);
end
%%
clear 
clc
%do this
time = linspace(0,50,100);
for index = 1:length(time);
    disp(index);
end
%%
clear 
clc
%y = 2^t;
time = linspace(0,50,100);
for index = 1:length(time);
    y = 2^time(index);
end
%%
clear 
clc
%y = 2^t;
time = linspace(0,50,100);
for index = 1:length(time);
    y(index) = 2^time(index);
end
figure(1)
plot(time, y)
%%
clear
clc
time = [-5 4 -3 2 -1 0 1 -2 3 -4 5];
for i = 1:length(time)
    if(time(i)<0)
        t(i) = -1;
    elseif (time(i)>0)
        t(i) = 1;
    else 
        t(i) = NaN;
    end
end
%%
clear
clc
x = linspace(-pi/2, pi/2, 100);

for i = 1:length(x)
    y = sin(x(i));
    [angle(i), radius(i)] = cart2pol(x(i),y);
end
%%
clear
clc
t = linspace(0,50,1000);
for i = 1:length(t)
    FV(i) = 1000*((1+0.05)^t(i));
end
figure(2)
plot(t,FV)
%%
clear
clc
t = 0:.1:30;
for i = 1:length(t)
    h(i) = (-9.8/2)*(t(i))^2+125*t(i)+500;
end
figure(3)
plot(t,h)
%% 
clear
clc
t = 0:.01:.7;
for i = 1:length(t)
    [x(i),y(i)] = trajectory_position(3, 45, t(i));
end
plot(x, y);
%% 
clear
clc
x = 3;

while(x > 0)
    disp('no');
    x = x-.1;
end
%%
clear
clc
x = linspace(0, 2*pi, 200);

n = 1; 
y = sin(x(n));
while (y >= 0)
    y(n) = sin(x(n));
    [theta, radius] = cart2pol(x(n), y(n));
    n = n + 1;
end
%%
clear
clc
t = 0;
i = 1;
FV = 0;
while (FV < 15000)
    FV = 1000*(1+.05)^t;
    FVplot(i) = FV;
    tplot(i) = t;
    t = t + 1;
    i = i + 1;
end

figure(4)
plot(tplot,FVplot)
%%
clear
clc
t = 0;
i = 1;
h = inf;
while(h >= 0)
    h = -9.8/2*t^2 + 125*t + 500;
    hplot(i) = h;
    tplot(i) = t;
    t = t + 1;
    i = i + 1;
end

figure(5);
plot(tplot, hplot);
%%
clear
clc
t = 0;
i = 1;
y = inf;
while(y > 0)
   [x, y] = trajectory_position(3, 45, t);
   xplot(i) = x;
   yplot(i) = y;
   t = t + .01;
   i = i + 1;
end

figure(6);
plot(xplot, yplot);