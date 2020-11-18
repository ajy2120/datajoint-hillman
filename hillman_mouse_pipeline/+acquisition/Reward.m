%{
#Reward
-> acquisition.CameraRun
---
reward_type           : enum('liquid sucrose', 'water', 'none')
reward_conc           : int #percentage
reward_amt            : decimal(4, 2)  # (mL per reward)
reward_limit          : decimal(4, 2)  # (total mL per session)
%}

classdef Reward < dj.Manual
end
