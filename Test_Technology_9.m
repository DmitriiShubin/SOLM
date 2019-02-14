clc
clear
cd C:\Users\Dmitrii\Dropbox\Xailum\Stend_V1\Matlab_script\9

Preset_tech_9 %preset experiment conditions

technology_test_preset_UL_9 %definition mocod

Data1 = logical(randi([0 1], Num_bits1, 1)); %creation data sequence
Data2 = logical(randi([0 1], Num_bits2, 1));
%H = comm.DifferentialEncoder;
%H1 = comm.DifferentialDecoder;
%Data2 = step(H,Data2);

Txdata_processing_tech_UL_9; % Coding and interleaving

technology_test_preset_LL_9 %d

Txdata_processing_tech_LL_9

technology_test_preset_UL_9 

Tx_PHL_forming_tech_9 %modulation, pilot and sof insertion, filterring and signal forming

%sound(0.001*out,48000,16);

%record
%clear out
%PLL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SOF_frame_sync
 
%Sof_freq_estimation
Freq_pll_2 = 0.4;
SOF_frame_sync_2_9
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SOF_extraction_9 
%%%%
Pilot_phase_sync_9

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AGC_9% работает

Pilot_extraction_9

technology_test_preset_LL_9

Rx_PHL_processing_LL_9

Rx_data_processing_LL_9

LL_remodulation_9

technology_test_preset_UL_9

Rx_PHL_processing_UL_9

Rx_data_processing_UL_9 % еще не создана

BER_calculation_tech_9