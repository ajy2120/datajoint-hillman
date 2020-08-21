%{
-> acquisition.CameraRun
---
stim_type             : enum('air puff', 'whisker', 'visual')
stim_duration         : float
stim_number           : tinyint unsigned
stim_randomized       : boolean
%}

classdef Stimulus < dj.Manual
end
