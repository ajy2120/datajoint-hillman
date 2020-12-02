
%{
# Subject
subject_id                  : varchar(32)                   # unique mouse id
---
dob                         : date                          # mouse date of birth
sex="U"                     : enum('M','F','U')             # sex of mouse - Male, Female, or Unknown/Unclassified
breeding_pair               : varchar(255)                  # 2 str for parents
-> subject.Species
mark_type="ear"             : enum('ear','toe','tail')      # 
mark                        : varchar(128)                  # 
-> lab.Source
-> subject.Strain
subject_notes               : varchar(1024)                 # 
subject_ts="current_timestamp()": timestamp                 # 
%}

classdef Subject < dj.Manual

end
