recObj = audiorecorder(48000,16,1);
disp('Record has been started.')
recordblocking(recObj, s+2);
disp('End of Recording.');

% Store data in double-precision array.
recieved = getaudiodata(recObj,'single');

% Plot the waveform.
figure
plot(recieved);
clear recObj