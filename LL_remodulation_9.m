BHCH_out = zeros(16200*numpackets/3,1,'logical');
buff = zeros(16008,1,'logical');
for i = 1:numpackets/3
    buff = Decoded_data_LL(1 + (i-1)*16008: i* 16008);
    BHCH_out(1 + (i-1)*16200:i*16200) = step(hBCHEnc,buff) ;
end;

clear buff;

a = reshape(BHCH_out,[16200,numpackets/3]);
clear BHCH_out
Coded_data = zeros(64800,numpackets/3,'logical');

for j = 1:numpackets/3
    Coded_data(:,j) = step(hLDPCEnc,a(:,j));
end
clear a
Coded_data_reshaped = reshape(Coded_data,[size(Coded_data,1)*size(Coded_data,2),1]);

clear Coded_data



%{
for i = 1:numpackets
    buff = BHCH_out(1 + (i-1)*16200: i* 16200);
    Coded_data(1 + (i-1)*64800:i*64800) = step(hLDPCEnc,buff);
end;

%clear buff;

%clear BHCH_out;

Coded_data = Coded_data';

%}
Recoded_LL = zeros(64800*numpackets/3,1,'logical');

for i = 1:numpackets/3
    buff = Coded_data_reshaped(1 + (i-1)*64800:i*64800);
    Recoded_LL(1 + (i-1)*64800:i*64800) = step(hIntrlv,buff);
end;
clear buff;
%IntrlvrOut= IntrlvrOut';

clear Coded_data_reshaped;

coef_recovery_reshaped = zeros(size(Recoded_LL,1),1);

for i = 1:size(Recoded_LL,1)

if Recoded_LL(i) == 1
    coef_recovery_reshaped(i) = 0.82;
elseif Recoded_LL(i) == 0
    coef_recovery_reshaped(i) = 1.39;
end
end
