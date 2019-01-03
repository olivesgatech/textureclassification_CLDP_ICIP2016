%% riu2 CLDP_D with NNC
%% Dataset outex 10

% clear all;

function [accuracyCLBP, elapsedtime]=test_clbp_d_outex(p,r)

tic
% %% Parameter settings
% p = 8;
% r = 2;

% theta_feature = 90;                  % Feature selection threshold parameter (must be set between 85 to 95)


% Open the files with pre-defined training and testing partitions
fid1 = fopen('train.txt');
fid2 = fopen('test.txt');
train_num = str2double(fgets(fid1)); 
test_num = str2double(fgets(fid2));
train_class = zeros(train_num,1);
test_class = zeros(test_num,1);

% mapping=getmapping(p,'u2');        % Mapping can also be used, but it
                                     % results in drop of performance
mapping=getmapping(p,'riu2'); 



% Compute the rlbp descriptor for the training images
for i = 1:train_num
    
    ln = fgets(fid1);
    line_split = strsplit(ln);
    img = imread(line_split{1});
    train_class(i,1) = str2double(line_split{2});
    clbp_trains(i,:) = cldp_d(img,r,p,mapping,'h');
    
end
fclose(fid1);


% Compute the rlbp descriptor for the testing images
for i = 1:test_num
    
    ln = fgets(fid2);
    line_split = strsplit(ln);
    img = imread(line_split{1});
    test_class(i,1) = str2double(line_split{2});
    clbp_tests(i,:) = cldp_d(img,r,p,mapping,'h');

end
fclose(fid2);




% % Feature selection based on the frequency of the patterns
% % dominant_ids = get_dominant_ids(rlbp_trains, 0.01*theta_feature);
% dominant_ids = get_dominant_ids(clbp_trains, 0.01*theta_feature);

%%

% Classification 
DM = zeros(test_num,train_num);
% DM = zeros(test_num,1);
for j=1:test_num;
%     test = rlbp_tests(j,dominant_ids);
    test = clbp_tests(j,:);
    DM(j,:) = distMATChiSquare(clbp_trains(:,:),test)';

end



% Classification accuracy
accuracyCLBP = ClassifyOnNN(DM,train_class,test_class);

elapsedtime=toc;
