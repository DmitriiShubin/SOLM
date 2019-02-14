Error1 = xor(Data1,Decoded_data_UL);
Error2 = xor(Data2,Decoded_data_LL);
BER = (size(find(Error1 == 1),1) + size(find(Error2 == 1),1))/(Num_bits1+Num_bits2);

X = sprintf('Simulaion Complete');
disp(X)

X = sprintf('A total number of erros is %d. It is equal to %d BER.',(size(find(Error1 == 1),1)+size(find(Error2 == 1),1)),BER);
disp(X)


