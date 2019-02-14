Rx_data_I = real(Rx_data);
Rx_data_Q = imag(Rx_data);
%clear Rx_data


Demodout_I = zeros(size(Rx_data_I,1),1);
Rx_data_I_mod = [Rx_data_I;zeros(number_s,1)];
a = size(Rx_data_I,1);
%clear Rx_data_I

for i = 1:a
    Demodout_I(i)= mean(Rx_data_I_mod(1+(i-1):((i-1)+number_s)));
end
%clear Rx_data_I_mod

I_signal = zeros(size(Demodout_I,1)/number_s,1);

for i = 1:size(I_signal,1)
    
        I_signal(i) = Demodout_I(1 + (i-1)*4);
end
%clear Demodout_I
Demodout_Q = zeros(size(Rx_data_Q,1),1);
Rx_data_Q_mod = [Rx_data_Q;zeros(number_s,1)];
a = size(Rx_data_Q,1);
%clear Rx_data_Q
for i = 1:a
    Demodout_Q(i)= mean(Rx_data_Q_mod(1+(i-1):((i-1)+number_s)));
end
%clear Rx_data_Q_mod

Q_signal = zeros(size(Demodout_Q,1)/number_s,1);

for i = 1:size(Q_signal,1)
    
        Q_signal(i) = Demodout_Q(1 + (i-1)*4);
end
%clear Demodout_Q
Rx = I_signal + 1i*Q_signal;
%clear I_signal
%clear Q_signal

DemodOut_UL = zeros(size(Rx,1)*3,1);

Var = 1/(10^(EsNodB/10));
for i = 1:size(Rx,1)
    Var1 = coef_recovery_reshaped(i)*Var;
    hDemod.Variance = Var1;
    DemodOut_UL(1+(i-1)*3:3*i) = step(hDemod,Rx(i));
end




%DemodOut = step(hDemod, Rx);
%clear Rx