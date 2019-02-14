BHCH_out = zeros(38880*numpackets,1,'logical');
buff = zeros(38688,1,'logical');
for i = 1:numpackets
    buff = Data1(1 + (i-1)*38688: i* 38688);
    BHCH_out(1 + (i-1)*38880:i*38880) = step(hBCHEnc,buff) ;
end;

clear buff;

a = reshape(BHCH_out,[38880,numpackets]);
clear BHCH_out
Coded_data = zeros(64800,numpackets,'logical');

for j = 1:numpackets
    Coded_data(:,j) = step(hLDPCEnc,a(:,j));
end
clear a
Coded_data_reshaped = reshape(Coded_data,[size(Coded_data,1)*size(Coded_data,2),1]);

clear Coded_data



%{
for i = 1:numpackets
    buff = BHCH_out(1 + (i-1)*38880: i* 38880);
    Coded_data(1 + (i-1)*64800:i*64800) = step(hLDPCEnc,buff);
end;

%clear buff;

%clear BHCH_out;

Coded_data = Coded_data';

%}
IntrlvrOut_UL = zeros(64800*numpackets,1,'logical');

for i = 1:numpackets
    buff = Coded_data_reshaped(1 + (i-1)*64800:i*64800);
    IntrlvrOut_UL(1 + (i-1)*64800:i*64800) = step(hIntrlv,buff);
end;
clear buff;
%IntrlvrOut= IntrlvrOut';

clear Coded_data_reshaped;