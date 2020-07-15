clear all
clc
close all
%% import excel tables - subject
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Subject');
data = table2struct(data);

for i = 1:numel(data)
    data(i).dob = datestr(data(i).dob,29);
end

%%%%%%%%    insert subjects
insert(hillman_mouse_subject.Subject,data)


%%%%%%%%    insert nicknames
nicknames = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Nicknames');
nicknames = table2struct(nicknames);

insert(hillman_mouse_subject.Nickname,nicknames)

%% import excel tables - surgery
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Surgery');
data = table2struct(data);

for i = 1:numel(data)
    data(i).surgery_date = datestr(data(i).surgery_date,29);
end

%%%%%%%%    insert surgery
insert(hillman_mouse_action.Surgery,data)

%% import excel tables - session
clc
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Session');
data = table2struct(data);

for i = 1:numel(data)
    data(i).session_date = datestr(data(i).session_date,29);
end

%%%%%%%%    insert surgery
insert(hillman_mouse_acquisition.Session,data)


% QUESTIONS: what to do about when we don't give anesthesia or a drug? how
% to make nullable since it's a primary key?

%% import excel tables - run
clc
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Run');
data = table2struct(data);

for i = 1:numel(data)
    data(i).session_date = datestr(data(i).session_date,29);
end

insert(hillman_mouse_acquisition.CameraRun,data)

%% import excel tables - runLED
clc
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','runLED');
data = table2struct(data);

for i = 1:numel(data)
    data(i).session_date = datestr(data(i).session_date,29);
end

insert(hillman_mouse_acquisition.CameraRunLed,data)

% QUESTIONS: how do i get multiple options?

%% import excel tables - stimulus
clc
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Stimulus');
data = table2struct(data);

for i = 1:numel(data)
    data(i).session_date = datestr(data(i).session_date,29);
end

insert(hillman_mouse_acquisition.Stimulus,data)

% QUESTION: how to turn on ONLY IF it's runtype (in CameraRun) is stimulus?
%% insert one-off things
data = struct('location','wfom2','location_description','the right one');
insert(hillman_common_lab.Location,data);
