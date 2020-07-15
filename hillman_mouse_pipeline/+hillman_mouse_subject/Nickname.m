%{
#nickname
nickname: varchar(32)
---
->hillman_mouse_subject.Subject
unique index (subject_id)
%}

classdef Nickname < dj.Manual
    
end