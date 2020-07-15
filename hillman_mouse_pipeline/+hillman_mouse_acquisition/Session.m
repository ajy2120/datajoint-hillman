%{
-> hillman_mouse_subject.Nickname
session_date      : date
session_index     : tinyint unsigned
---
session_start_time: time
(session_location) -> hillman_common_lab.Location
(primary_experimenter) -> hillman_common_lab.LabMember
data_directory    : varchar(255)
-> hillman_mouse_action.Anesthesia
-> hillman_mouse_action.Dosage
%}

classdef Session < dj.Manual
    
end

