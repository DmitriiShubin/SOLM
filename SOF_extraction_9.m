recieved_I_frame_sync_reshaped = reshape(recieved_I_frame_sync,[22166*number_s,numpackets]);
clear recieved_I_frame_sync
recieved_I_frame_sync_reshaped_wo_sof = recieved_I_frame_sync_reshaped(26*4+1:end,:);
clear recieved_I_frame_sync_reshaped
I_frame_sync_wo_sof = reshape(recieved_I_frame_sync_reshaped_wo_sof,[size(recieved_I_frame_sync_reshaped_wo_sof,1)*size(recieved_I_frame_sync_reshaped_wo_sof,2),1]);
clear recieved_I_frame_sync_reshaped_wo_sof

recieved_Q_frame_sync_reshaped = reshape(recieved_Q_frame_sync,[22166*number_s,numpackets]);
clear recieved_Q_frame_sync
recieved_Q_frame_sync_reshaped_wo_sof = recieved_Q_frame_sync_reshaped(26*4+1:end,:);
clear recieved_Q_frame_sync_reshaped
Q_frame_sync_wo_sof = reshape(recieved_Q_frame_sync_reshaped_wo_sof,[size(recieved_Q_frame_sync_reshaped_wo_sof,1)*size(recieved_Q_frame_sync_reshaped_wo_sof,2),1]);
clear recieved_Q_frame_sync_reshaped_wo_sof