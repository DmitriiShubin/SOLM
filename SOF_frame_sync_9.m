inter = 6;

%{
h1 = intfilt(inter,2,0.5);
D2 = mean(grpdelay(h1));

xr = upsample(out,inter);
y = filter(h1,[xr; zeros(D2,1)]);
%}
%out = recieved;
%Freq_pll_1 = 0;

% ÍÓÆÍÎ ÍÅ ÇÀÁÛÒÜ ÏÎÌÅÍßÒÜ ÍÀ RECIEVED
Fs_int = Fs*inter;
T_in = 1/Fs;
L = size(out,1); % Length of recieved signal         
t =  ((0:L-1)*T_in);
t = t';% Time vector

recieved_I = out.*cos(2*pi*(f - Freq_pll_1)*t);
low_pass = [-0.000470907430743493 -0.000437361347039994 2.99136922198555e-18 0.000496775918377593 0.000604321045950798 0.000141581535126709 -0.000574940879334697 -0.000899403594177566 -0.000397365931592921 0.000654456449409570 0.00133680239930951 0.000842108570651388 -0.000656628715761547 -0.00190092069484592 -0.00154419240920160 0.000478760202198848 0.00254081977393069 0.00255562183766106 -4.19563952769886e-18 -0.00316711471774318 -0.00390315727329128 -0.000912099605650995 0.00365086752986672 0.00558174141445071 0.00239654898677380 -0.00382289997191380 -0.00755113816809724 -0.00459897088519919 0.00346998079334781 0.00973635477146274 0.00768305098760068 -0.00232025188160185 -0.0120319869249529 -0.0118666579858930 9.58846199622488e-18 0.0143101670475314 0.0175163906929742 0.00408699092063409 -0.0164313628286625 -0.0254056777055936 -0.0111200079771985 0.0182569204633219 0.0375550605748005 0.0241768195041314 -0.0196620185798643 -0.0610822033898605 -0.0555012952754185 0.0205476243989697 0.146624793031549 0.264638000398036 0.312752009851146 0.264638000398036 0.146624793031549 0.0205476243989697 -0.0555012952754185 -0.0610822033898605 -0.0196620185798643 0.0241768195041314 0.0375550605748005 0.0182569204633219 -0.0111200079771985 -0.0254056777055936 -0.0164313628286625 0.00408699092063409 0.0175163906929742 0.0143101670475314 9.58846199622488e-18 -0.0118666579858930 -0.0120319869249529 -0.00232025188160185 0.00768305098760068 0.00973635477146274 0.00346998079334781 -0.00459897088519919 -0.00755113816809724 -0.00382289997191380 0.00239654898677380 0.00558174141445071 0.00365086752986672 -0.000912099605650995 -0.00390315727329128 -0.00316711471774318 -4.19563952769886e-18 0.00255562183766106 0.00254081977393069 0.000478760202198848 -0.00154419240920160 -0.00190092069484592 -0.000656628715761547 0.000842108570651388 0.00133680239930951 0.000654456449409570 -0.000397365931592921 -0.000899403594177566 -0.000574940879334697 0.000141581535126709 0.000604321045950798 0.000496775918377593 2.99136922198555e-18 -0.000437361347039994 -0.000470907430743493];
low_pass =  (low_pass);
h2 = dfilt.dffir(low_pass); % â fdatool: îêîíííûé FIR ôèëüòğ, ïîğÿäîê = 100*iner; ÷àñòîòà ñğåçà 7500, ÷àñòîòà äèñêğåòèçàöèè 48000*inter
clear low_pass
D3 = mean(grpdelay(h2));

recieved_I_filterred = filter(h2,[recieved_I; zeros(D3,1)]);
clear recieved_I

recieved_I_filterred_int = interp(recieved_I_filterred,inter);
clear recieved_I_filterred

recieved_Q = out.*sin(2*pi*(f - Freq_pll_1)*t);
clear out_int
clear t
recieved_Q_filterred = filter(h2,[recieved_Q; zeros(D3,1)]);
clear recieved_Q

recieved_Q_filterred_int = interp(recieved_Q_filterred,inter);
clear recieved_Q_filterred
% SOF CORRELATION AND EXTRACTION
% SOF sequence creation

sof =  ([0 1 1 0 0 0 1 1 0 1 0 0 1 0 1 1 1 0 1 0 0 0 0 0 1 0]');%26 ñèìâîëîâ

sof1 = 0.7*(sof*2 - 1);

a1 = ones(number_s*inter,1  );
sof_reshaped = zeros(size(sof,1)*number_s*inter,1);
for i = 1:size(sof,1)
        sof_reshaped((1 + (i-1)*(number_s*inter)): ((i*number_s*inter))) = a1*sof1(i);
end
clear a1
clear sof1
clear sof
%%%%


recieved_Q_filterred_sof = [recieved_Q_filterred_int;zeros(26*number_s*inter,1)];

m6 = zeros(size(recieved_Q_filterred_int,1),1);
for i = 1:(size(recieved_Q_filterred_int,1))
    m6(i) = (sum(recieved_Q_filterred_sof(1+(i-1):((i-1)+26*number_s*inter)).*sof_reshaped));
end
clear recieved_Q_filterred_sof

recieved_I_filterred_sof = [recieved_I_filterred_int;zeros(26*number_s*inter,1)];
m7 = zeros(size(recieved_I_filterred_int,1),1);
for i = 1:(size(recieved_I_filterred_int,1))
    m7(i) = (sum(recieved_I_filterred_sof(1+(i-1):((i-1)+26*number_s*inter)).*sof_reshaped));
end
clear recieved_I_filterred_sof
clear sof_reshaped

a = m6 + m7;
plot(a)
clear m6
clear m7
%{
m = 0.6 * max(a);

for i = 1:size(a,1)
    if a(i)>= m
        start = i;
    break
    end
end
%}
%s = start -11 + find(a(start-10:start+10) == max(a(start-10:start+10)));

start = find(a == max(a(1:48000*2*inter,:)));
clear a

recieved_I_filterred_int_zero = recieved_I_filterred_int(start+3:start-1+22166*number_s*inter*numpackets);
clear recieved_I_filterred_int

recieved_Q_filterred_int_zero = recieved_Q_filterred_int(start+3:start-1+22166*number_s*inter*numpackets);
clear recieved_Q_filterred_int

recieved_Q_frame_sync = decimate(recieved_Q_filterred_int_zero,inter,82,'fir');
clear recieved_Q_filterred_int_zero

recieved_I_frame_sync = decimate(recieved_I_filterred_int_zero,inter,82,'fir'); 
clear recieved_I_filterred_int_zero

recieved_I_frame_sync =  (recieved_I_frame_sync);
recieved_Q_frame_sync =  (recieved_Q_frame_sync);