%SaveGitInfo
%
%Saves the current git version info to a file with the current time in the
%filename.
%
%This can be used to create a record of which version was in use at various
%times.
function SaveGitInfo
git_info = GetGitInfo;
save(['git_version_' git_info.timestamp '.mat'], 'git_info');