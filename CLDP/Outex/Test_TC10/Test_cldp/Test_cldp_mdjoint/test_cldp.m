clear all
close all

% Outex TC10
addpath('C:\Users\yhu75\Dropbox (GhassanGT)\Yuting\Big_and_Data\Research\Trial\Texture representation\Database\Outex\TC10\Outex_TC_00010.tar\Outex_TC_00010\Outex_TC_00010\000');
addpath('C:\Users\yhu75\Dropbox (GhassanGT)\Yuting\Big_and_Data\Research\Trial\Texture representation\Database\Outex\TC10\Outex_TC_00010.tar\Outex_TC_00010\Outex_TC_00010\images');
% % Outex TC12:000
% addpath('C:\Users\yhu75\Dropbox (GhassanGT)\Yuting\Big_and_Data\Research\Texture representation\Database\Outex\TC12\Outex_TC_00012.tar\Outex_TC_00012\Outex_TC_00012\001');
% addpath('C:\Users\yhu75\Dropbox (GhassanGT)\Yuting\Big_and_Data\Research\Texture representation\Database\Outex\TC12\Outex_TC_00012.tar\Outex_TC_00012\Outex_TC_00012\images');

%% Parameter settings
for r=2:3
    for p=8:8:24
% for r=2
%     for p=8
        [accuracyCLBP(p/8,r), elapsedtime(p/8,r)]=test_cldp_mdjoint_outex(p,r);
    end
end
save