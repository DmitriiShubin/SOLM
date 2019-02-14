Recovered_offset_I = reshape(Recovered_offset_I,[5904,15*numpackets]);

Recovered_offset_Q = reshape(Recovered_offset_Q,[5904,15*numpackets]);


for j = 1:15*numpackets
    Pil_I = Recovered_offset_I(5761+10:5904-10,j);
    Pil_Q = Recovered_offset_Q(5761+10:5904-10,j);
    
    Amp = abs(mean(Pil_I+1i*Pil_Q));
    clear Pil_I
    clear Pil_Q
    Recovered_offset_I(:,j) = (1/Amp)*Recovered_offset_I(:,j);
    Recovered_offset_Q(:,j) = (1/Amp)*Recovered_offset_Q(:,j);
end