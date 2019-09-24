clear all;
bits = [1 0 1 1 1 0 0 1]
bitrate = 1;
n = 1000;
T = length(bits)/bitrate;
N = n*length(bits);
dt = T/N;
t = 0:dt:T;
x = zeros(1,length(t));
for i=1:length(bits)
  if bits(i)==1
    x((i-1)*n+1:i*n) = 1;
  else x((i-1)*n+1:i*n) = -1;
  end
end
plot(t, x, 'Linewidth', 3);
axis([0 T -2 2]);
grid on 
set(gca,'xtick',[0:1:T])
set(gca,'ytick',[-2 : 2])
counter = 0;
z=1;
for i = 1:length(t)
  if t(i)>counter
    counter = counter + 1/bitrate;
    if x(i)>0
      result(z) = 1;
      z=z+1;
    else result(z) = 0;
      z=z+1;
    end
  end
end
disp('NRZ-L Decoding:');
disp(result);