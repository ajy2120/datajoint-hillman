%{
#surgery
-> subject.Nickname
surgery_index: tinyint              # it is just for the animal not general.
---
-> action.SurgeryType
head_plate: enum('wfom','2P')       # head plate for a specific setup
surgery_date: date                  #
terminal: bool                      # TBD
surgery_notes='': varchar(1024)
surgery_ts = CURRENT_TIMESTAMP: timestamp
%}

classdef Surgery < dj.Manual

end
