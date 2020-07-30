%{
#BehaviorRig
-> hillman_mouse_acquisition.Session
---
rig_type : enum('altcocon', 'treadwheel')
rig_description='': varchar(1024)
webcam_number     : tinyint unsigned
webcam_type       :
%}

classdef BehaviorRig < dj.Manual
end
