subsystemType = 'QPSK 1/4';     
EsNodB        = SNR-11.9; 

Var = 1/(10^(EsNodB/10));

configureDVBS2Demo

hLDPCEnc = comm.LDPCEncoder(dvb.LDPCParityCheckMatrix);

hLDPCDec = comm.LDPCDecoder(dvb.LDPCParityCheckMatrix, ...
    'IterationTerminationCondition', 'Parity check satisfied', ...
    'MaximumIterationCount',         dvb.LDPCNumIterations, ...
    'NumIterationsOutputPort',       true);

%hDemod = comm.PSKDemodulator(2, 'PhaseOffset',0,'DecisionMethod','Log-likelihood ratio','Variance',Var);

%hDemod = comm.BPSKDemodulator('BitOutput',true,...
    %'DecisionMethod','Log-likelihood ratio');