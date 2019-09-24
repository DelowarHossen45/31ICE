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
  if bits(i)==1
    x((i-1)*n+1:i*n) = -lastbit;
    lastbit = -lastbit;
  else x((i-1)*n+1:i*n) = lastbit;
  end
end
plot( t, x, 'Linewidth', 3);
axis([0 T -2 2 ]);
grid on 
set(gca,'xtick',[0:1:T])
set(gca,'ytick',[-2:1:2])
counter = 0;
lastbit = 1;
z=0;
for i = 1:length(t)
  if t(i)>counter
    counter = counter + (1/bitrate);
    if x(i)!=lastbit
      z=z+1;
      result(z) = 1;
      
      lastbit = -lastbit;
    else z=z+1;result(z) = 0;
  end
  end
end
disp('NRZ-I Decoding:');
disp(result);