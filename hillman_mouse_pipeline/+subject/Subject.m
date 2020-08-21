
%{
# Subject
subject_id: varchar(32)                  # unique mouse id
---
subject_colony_name: varchar(255)
dob: date                     # mouse date of birth
sex='U': enum('M', 'F', 'U')       # sex of mouse - Male, Female, or Unknown/Unclassified
breeding_pair='':    varchar(255)             # 2 str for parents
-> subject.Species
mark_type='ear': enum('ear', 'toe', 'tail')
mark='':             varchar(128)
-> lab.Source
-> subject.Strain
subject_notes='':    varchar(1024)
subject_ts = CURRENT_TIMESTAMP: timestamp
%}

classdef Subject < dj.Manual

end
