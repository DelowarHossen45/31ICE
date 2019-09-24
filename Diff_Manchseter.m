clc;
clear all;
bits = [1 0 1 1 1 0 0 1]
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));
lastbit = 1;
for i=1:length(bits)
  if bits(i)==0
    x((i-1)*n+1:(i-1)*n+n/2) = -lastbit;
    x((i-1)*n+n/2:i*n) = lastbit;
  else
    x((i-1)*n+1:(i-1)*n+n/2) = lastbit;
    x((i-1)*n+n/2:i*n) = -lastbit;
    lastbit = -lastbit;
  end
end
plot(t, x, 'Linewidth', 3);
axis([0 T -2 2 ]);


xlabel("time");
ylabel("Amplitude");
title('Differential Manchester line coding');
grid on 
set(gca,'xtick',[0:1:T])
set(gca,'ytick',[-2:1:2])
counter = 0;
z=1;
lastbit = 1;
for i = 1:length(t)
  if t(i)>counter
    counter = counter + 1/bitrate;
    if x(i)==lastbit
      result(z) = 1;
      z=z+1;
      lastbit = -lastbit;
    else result(z) = 0;
      z=z+1;
    end
  end
end
disp('Differential Manchester Decoding:');
disp(result);