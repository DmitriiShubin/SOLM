DeIntrlvrOut = zeros(size(DemodOut,1),1);



for i = 1:numpackets/3
    buff = DemodOut(1 + (i-1)*64800:i*64800);
    DeIntrlvrOut(1 + (i-1)*64800:i*64800) = step(hDeintrlv,buff);
end;
%clear buff;
%clear DemodOut


buff = zeros(64800,1);
LDPC_out = zeros(16200*numpackets/3,1);
inerations = zeros(numpackets/3,1);
for i = 1:numpackets/3
    buff = DeIntrlvrOut(1 + (i-1)*64800:i*64800);
    [LDPC_out(1 + (i-1)*16200:i*16200),inerations(i)] = step(hLDPCDec,  buff);
end;

%clear buff
%clear DeIntrlvrOut

%LDPC_out = LDPC_out';

%{

a = reshape(DeIntrlvrOut,[64800,numpackets/3]);
LDPC_out = zeros(16200,numpackets/3);

for j = 1:numpackets/3
    LDPC_out(:,j) = step(hLDPCDec,a(:,j));
end
LDPC_out_reshaped = reshape(LDPC_out,[size(LDPC_out,1)*size(LDPC_out,2),1]);



%clear buff;
LDPC_out = LDPC_out';
%}

buff = zeros(16200,1);
Decoded_data_LL = zeros(size(Data2,1),1);
for i = 1:numpackets/3
    buff = LDPC_out(1 + (i-1)*16200: i* 16200);
    Decoded_data_LL(1 + (i-1)*16008:i*16008) = step(hBCHDec,buff) ;
end;

%Decoded_data_LL = step(H1,Decoded_data_LL);
%clear buff
%clear LDPC_out


%Decoded_data = Decoded_data';