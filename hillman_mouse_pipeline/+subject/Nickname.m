%{
#nickname
nickname: varchar(32)
---
->subject.Subject
unique index (subject_id)
%}

classdef Nickname < dj.Manual

end
