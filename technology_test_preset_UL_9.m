subsystemType = '8PSK 3/5';     
EsNodB        = SNR; 

configureDVBS2Demo

hLDPCEnc = comm.LDPCEncoder(dvb.LDPCParityCheckMatrix);

hLDPCDec = comm.LDPCDecoder(dvb.LDPCParityCheckMatrix, ...
    'IterationTerminationCondition', 'Parity check satisfied', ...
    'MaximumIterationCount',         dvb.LDPCNumIterations, ...
    'NumIterationsOutputPort',       true);