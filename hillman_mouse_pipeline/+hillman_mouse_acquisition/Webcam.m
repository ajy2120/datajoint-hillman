%{
#Webcam     %saved in {Session.session_data_directory}/webcam/{CameraRun.run_index}/{Webcam.webcam_index}, tagged as cam0 or cam1
-> hillman_mouse_acquisition.CameraRun
webcam_index    : tinyint unsigned (0 or 1)
---
webcam_type       : enum('BlackFly', 'psEye')
webcam_orient     : enum('face', 'body', 'pupil')
webcam_framerate  : decimal(4,2)
%}

classdef Webcam < dj.Manual
end