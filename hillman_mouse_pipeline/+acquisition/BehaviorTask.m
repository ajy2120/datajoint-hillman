%{
#BehaviorTask
-> acquisition.CameraRun
---
task_type             : enum('alternation', 'cocontraction')
reward_thresh         : decimal(4, 2)  #condition for reward (eg. # of turns)
%}

classdef BehaviorTask< dj.Manual
end
