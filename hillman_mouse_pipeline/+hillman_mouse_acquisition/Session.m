%{
# Session
-> hillman_mouse_subject.Nickname
session_index     : tinyint unsigned
---
-> hillman_mouse_acquisition.ExpProject
drug_given:                  bool
session_datetime:     datetime
(session_location) -> hillman_common_lab.Location
(primary_experimenter) -> hillman_common_lab.LabMember
data_directory    : varchar(255)
%}

classdef Session < dj.Manual
    
end

