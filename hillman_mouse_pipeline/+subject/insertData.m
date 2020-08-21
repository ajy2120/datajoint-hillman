% insertData

% draw(dj.ERD(subject.getSchema)) % show the pipeline
describe(subject.Strain) % describe the table
%syncDef(subject.Strain)    %update a table

% insert entries individually
data = struct('strain_name','cdH5-GCaMP8','strain_description','G8-endo');
insert(subject.Strain,data)

data = struct('strain_name','Ai95','strain_description','notsure');
insert(subject.Strain,data)

data = struct('strain_name','ASAP2c-Kv','strain_description','voltage');
insert(subject.Strain,data)

%% insert entries simultaneously - Strain
data = struct;
strainnames = {'Ai95','ASAP2s-Kv','cdH5-GCaMP8','EGFP-M','Thy1-GCaMP6f','JRGECO1a'};
straindes = {'Used for double cross','Voltage','Endothelial gcamp','Sam exp','gcamp6f','jrgeco'};

for i = 1:length(strainnames)
    data(i).strain_name = strainnames{i};
    data(i).strain_description = straindes{i};
end
insert(subject.Strain,data)

% see table
subject.Strain

%% Mark
clear data
data = struct;
marknames = {'ear','toe','tail'};
markdes = {'punch or tattoo','which toe','tail color'};

for i = 1:length(marknames)
    data(i).mark_type= marknames{i};
    data(i).mark_description = markdes{i};
end
insert(subject.SubjectMark,data)

% see table
subject.SubjectMark

%% Source
clear data
data = struct;

source_name = {'in house', 'Lin', 'Bruno'};
source_full_name = {'in house', 'Lin Lab', 'Bruno Lab'};
contact_details = {'lfoi', 'email', 'email'};
link_to_website = {'www.zi.columbia.edu','www.google.com','www.zi.columbia.edu'};
source_description = {'bred in house','given by Michael Lin','collaboration with Bruno Lab'};

for i = 1:length(source_name)
    data(i).source_name= source_name{i};
    data(i).source_full_name = source_full_name{i};
    data(i).contact_details = contact_details{i};
    data(i).link_to_website = link_to_website{i};
    data(i).source_description = source_description{i};
end
insert(subject.Source,data)

% see table
subject.Source

%% Allele
% can't describe Allele, Death, or Zigosity
data = struct('allele_name','gcamp+','Source','in house','allele_source','JAX','source_identifier','JAX','source_url','www.jaxlabs.com',...
    'expression_data_url','www.jacksonlabs.com','source_description','none','source_contact','phone');
insert(subject.Allele,data)

%% insert loaded data structure

load /home/hz2356/Documents/DataJoint/Code/data_list.mat
insert(subject.Subject,data)

%% insert subjects manually
clear data
subject_id = {'1','2','3'};
subject_nickname = {'A019','A020','A021'};
subject_colony_name = {'Ai95','Ai95','Ai95'};
dob = {'','','','',''};
sex = {'M','F','M','M','F'};
breeding_pair = {'','','','',''};
subject_type = {'mouse'};
mark = {'1L','1R','1L/1R','none','1R'};
subject_notes = {'cute','jumpy','bites','calm','fat'};

mark_type = {'ear','ear','ear','ear','ear'};
source_name = {'in house','in house','in house','in house','in house'};
strain_name = {'jRGECO1','jRGECO1','jRGECO1','jRGECO1','jRGECO1'};

for i = 1:length(subject_id)
    data(i).subject_id= subject_id{i};
    data(i).subject_nickname = subject_nickname{i};
    data(i).subject_colony_name = subject_colony_name{i};
    data(i).dob = dob{i};
    data(i).sex = sex{i};
    data(i).breeding_pair = breeding_pair{i};
    data(i).subject_type = subject_type{1};
    data(i).mark_type = mark_type{i};
    data(i).mark = mark{i};
    data(i).source_name = source_name {i};
    data(i).strain_name = strain_name{i};
    data(i).subject_notes = subject_notes{i};
end

insert(subject.Subject,data)

%% delete strain
del(subject.SubjectMark & "mark_type='ear'")

%% import excel tables
clearvars -except basepath
basepath = '/home/hz2356/Documents/DataJoint/Code/';
data = readtable('/home/hz2356/Documents/DataJoint/Code/mouse-colony.xlsx');
data = table2struct(data);

for i = 1:numel(data)
    data(i).dob = datestr(data(i).dob,29);
end

insert(subject.Subject,data)

%%  only insert new/difference data
clearvars -except basepath

% fetch data
fetched_data = fetch(subject.Subject,'subject_id');

% read new data in
data = readtable([basepath,'mouse-colony-update.xlsx']);
data = table2struct(data);
    % fix dob date format
    for i = 1:numel(data)
        data(i).dob = datestr(data(i).dob,29);
    end

% find differences
idx_insert = [];
for i = 1:numel(data)
    if sum(strcmp(data(i).subject_id,{fetched_data.subject_id})) == 0
        idx_insert(numel(idx_insert)+1) = i;
    end
end

% insert new data
for i = idx_insert
    insert(subject.Subject,data(i))
end

%%
%syncDef(subject.Strain)    %update a table

%% subject
data(2)= struct('subject_id','J160','subject_colony_name','J160','dob','2019-03-10','sex','M',...
    'breeding_pair','J147xJ152','species','mouse','mark_type','ear','mark','L','source_name','in house','strain_name','JRGECO1a');
insert(subject.Subject,data)

%% surgery
data = struct('nickname','cm127','surgery_index',1,'surgery_type','thin-skull');
