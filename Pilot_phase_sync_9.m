Pilot_I = reshape(I_frame_sync_wo_sof,[5904,15*numpackets]);
%clear I_frame_sync_wo_sof
Pilot_Q = reshape(Q_frame_sync_wo_sof,[5904,15*numpackets]);
%clear Q_frame_sync_wo_sof

Recovered_offset = zeros(size(Pilot_I,1),size(Pilot_I,2));


for j = 1:15*numpackets
    
Pil_I = mean(Pilot_I(5761:5904,j));

Pil_Q = mean(Pilot_Q(5761:5904,j));

Pilot = Pil_I + 1i*Pil_Q;
%clear Pil_I
%clear Pil_Q

phase = angle(Pilot);


offset = phase - angle(0.7+0.7i);
%clear phase

Pilot = Pilot_I(:,j) + 1i*Pilot_Q(:,j);

ang = angle(Pilot);

Recovered_offset(:,j) = abs(Pilot).*(cos( ang - offset )+1i*sin(ang - offset ));
%clear offset
%clear Pilot
%clear ang
end

Recovered_offset_I = zeros(size(Pilot_I,1),size(Pilot_I,2));

Recovered_offset_Q = zeros(size(Pilot_Q,1),size(Pilot_Q,2));

%clear Pilot_Q
%clear Pilot_I

Recovered_offset_I = real(Recovered_offset);

Recovered_offset_Q = imag(Recovered_offset);

%clear Recovered_offset
%Recovered_offset1 = mean(Recovered_offset,2);

%{
Recovered = zeros(size(Recovered_offset_I,1),size(Recovered_offset_I,2));
for j = 1:15*numpackets

Pilot = Recovered_offset1(5761:5904);
phase = angle(Pilot);
p = diff(unwrap(phase));
plot(p)

m = mean(p(25:125));


Recovery = Recovered_offset_I(1:5904,j) + 1i*Recovered_offset_Q(1:5904,j);

phase = angle(Recovery);
phase_freq = zeros(size(phase,1),1);
for i = 1:5904
    phase_freq(5904 - (i-1)) = phase(5904 - (i-1)) + ((i-1))*m;
end

Recovered(:,j) = abs(Recovery).*(cos(phase_freq)+1i*sin(phase_freq));
end

Recovered_offset_I = real(Recovered);
Recovered_offset_Q = imag(Recovered);
%}
%{
Pil_I_freq = Pilot_I(5761:5904,1:15);

Pil_Q_freq = Pilot_Q(5761:5904,1:15);

Pil_I_freq_m = mean(Pil_I_freq,2);

Pil_Q_freq_m = mean(Pil_Q_freq,2);


Pilot_freq = Pil_I_freq_m + 1i*Pil_Q_freq_m;

phase = angle(Pilot_freq);
d = diff(unwrap(phase));
plot(d)

m = mean(d(25:100));
%}