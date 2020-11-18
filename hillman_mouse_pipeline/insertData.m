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
insert(subject.Subject,data)


%%%%%%%%    insert nicknames
nicknames = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Nicknames');
nicknames = table2struct(nicknames);

insert(subject.Nickname,nicknames)

%% import excel tables - surgery
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Surgery');
data = table2struct(data);

for i = 1:numel(data)
    data(i).surgery_date = datestr(data(i).surgery_date,29);
end

%%%%%%%%    insert surgery
insert(action.Surgery,data)


%% import excel tables - weighing and anesthesia
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
weight = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Weighing');
weight = table2struct(weight);

for i = 1:numel(weight)
    weight(i).weighing_time = datestr(weight.weighing_time,'yyyy-mm-dd HH:MM:SS');
end

insert(action.Weighing,weight)

anesthesia = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Anesthesia');
anesthesia = table2struct(anesthesia);

for i = 1:numel(anesthesia)
    anesthesia(i).time_given = datestr(anesthesia(i).time_given, 'yyyy-mm-dd HH:MM:SS');
end

insert(action.Anesthesia,anesthesia)

%% import excel tables - session
clc
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Session');
data = table2struct(data);

for i = 1:numel(data)
    data(i).session_date = datestr(data(i).session_date,29);
    data(i).session_start_time = datestr(data(i).session_start_time,'HH:MM:SS');
end

%%%%%%%%    insert surgery
insert(acquisition.Session,data)


%% import excel tables - drug dosage
clc
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','DrugDosage');
data = table2struct(data);

for i = 1:numel(data)
    data(i).session_date = datestr(data(i).session_date,29);
    data(i).dosage_time = datestr(data(i).dosage_time,'HH:MM:SS');
end

%%%%%%%%    insert surgery
insert(action.DrugDosage,data)

%% import excel tables - run
clc
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Run');
data = table2struct(data);

for i = 1:numel(data)
    data(i).session_date = datestr(data(i).session_date,29);
end

insert(acquisition.CameraRun,data)

%% import excel tables - runLED
clc
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','runLED');
data = table2struct(data);

for i = 1:numel(data)
    data(i).session_date = datestr(data(i).session_date,29);
end

insert(acquisition.CameraRunLed,data)


%% import excel tables - stimulus
clc
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony-update.xlsx','Sheet','Stimulus');
data = table2struct(data);

for i = 1:numel(data)
    data(i).session_date = datestr(data(i).session_date,29);
end

insert(acquisition.Stimulus,data)

%% insert one-off things
data = struct('location','wfom2','location_description','the right one');
insert(lab.Location,data);
