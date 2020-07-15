%{
  project                     : varchar(32)
  ---
  -> hillman_common_lab.LabMember
  project_description=''      : varchar(1024)
%}

classdef Project < dj.Lookup

end
