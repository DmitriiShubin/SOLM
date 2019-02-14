%Freq_pll_1 = -4
%recieved
%out
Freq_pll_1 = 0;
recieved = out;
%clear out


out1 = recieved(0.25*size(recieved,1):0.75*size(recieved,1));

h1 = dfilt.dffir(low_pass);
D2 = mean(grpdelay(h1));
out11 = double(filter(h1,[out1; zeros(D2,1)]));


T_in = 1/Fs;
L = size(out1,1); % Length of recieved signal         
t = (0:L-1)*T_in;
t = t';% Time vector

a = zeros(100,1);
for j = 1:100
    
   
cor_I = xcorr(cos(2*pi*(f-Freq_pll_1-5+0.1*j)*t),out11);
cor_Q = xcorr(sin(2*pi*(f-Freq_pll_1-5+0.1*j)*t),out11);

cor = (cor_I + cor_Q);
%clear cor_I
%clear cor_Q

L = size(cor,1);

Y = fft(cor);
%clear cor

P2 = abs(Y/L);
%clear Y
P1 = P2(1:L/2+1);
%clear P2
P1(2:end-1) = 2*P1(2:end-1);

a(j,1) = max(P1);

%clear P1
end

%clear out1
%clear t
Freq_pll_2 = Freq_pll_1 - (find(a == max(a))*0.1 -10)  ; %вычесть

%clear a



