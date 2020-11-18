%{
#Auxillary   %saved in {Session.session_data_directory}/auxillary/{CameraRun.run_index},
-> acquisition.CameraRun
->hillman_mouse_acqusition.AuxOutput
---
aux_sample_rate    : decimal(10,3) #DAQ Hz

%}

classdef Auxillary < dj.Manual
end
