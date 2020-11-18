%{
# Session
-> subject.Nickname
session_index     : tinyint unsigned
---
-> acquisition.ExpProject
drug_given:                  bool
session_datetime:     datetime
(session_location) -> lab.Location
(primary_experimenter) -> lab.LabMember
data_directory    : varchar(255)
%}

classdef Session < dj.Manual

end
