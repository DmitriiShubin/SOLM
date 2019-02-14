SNR = 7.8; %dB
Fs = 48000;
T = 1/Fs;  

numpackets = 3%170; % kolichestvo poketov po 64800 bits




boudrate = 12000; % number of boud rate, sumb/s

num_sumbols = (numpackets*64800/3 + 26*numpackets + 36*15*numpackets+50);
s = num_sumbols / boudrate; % number of seconds of transmittion
X = sprintf('The time of classic modulation test is %d seconds or %d minutes or %d houres.',s,round(s/60),round(s/3600));
disp(X)

Num_bits1 = numpackets*38688; % kolichestvo poleznih bit
Num_bits2 = (numpackets/3)*16008;

BER = ((Num_bits1+Num_bits2)^-1); % max ber

X = sprintf('The number of transmitted bits is %d. It is equal to %s BER or %s PER.',(Num_bits1+Num_bits2),BER,(BER*1504));
disp(X)

clear BER
clear X


number_s = Fs/boudrate; %number of samples of 1 transmitted signal

