DeIntrlvrOut = zeros(size(DemodOut_UL,1),1);



for i = 1:numpackets
    buff = DemodOut_UL(1 + (i-1)*64800:i*64800);
    DeIntrlvrOut(1 + (i-1)*64800:i*64800) = step(hDeintrlv,buff);
end;
clear buff;
clear DemodOut


buff = zeros(64800,1);
LDPC_out = zeros(38880*numpackets,1);
inerations = zeros(numpackets,1);
for i = 1:numpackets
    buff = DeIntrlvrOut(1 + (i-1)*64800:i*64800);
    [LDPC_out(1 + (i-1)*38880:i*38880),inerations(i)] = step(hLDPCDec,  buff);
end;

clear buff
clear DeIntrlvrOut

%LDPC_out = LDPC_out';

%{

a = reshape(DeIntrlvrOut,[64800,numpackets]);
LDPC_out = zeros(38880,numpackets);

for j = 1:numpackets
    LDPC_out(:,j) = step(hLDPCDec,a(:,j));
end
LDPC_out_reshaped = reshape(LDPC_out,[size(LDPC_out,1)*size(LDPC_out,2),1]);



clear buff;
LDPC_out = LDPC_out';
%}

buff = zeros(38880,1);
Decoded_data_UL = zeros(size(Data1,1),1);
for i = 1:numpackets
    buff = LDPC_out(1 + (i-1)*38880: i* 38880);
    Decoded_data_UL(1 + (i-1)*38688:i*38688) = step(hBCHDec,buff) ;
end;

clear buff
clear LDPC_out