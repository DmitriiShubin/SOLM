Recovered_offset = Recovered_offset_I + 1i*Recovered_offset_Q;
clear Recovered_offset_I
clear Recovered_offset_Q

Recovered_offset_wo_pilots = Recovered_offset(1:5760,:);
clear Recovered_offset
Rx_data = reshape(Recovered_offset_wo_pilots,[size(Recovered_offset_wo_pilots,1)*size(Recovered_offset_wo_pilots,2),1]);
clear Recovered_offset_wo_pilots
